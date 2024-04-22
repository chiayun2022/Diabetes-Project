libname lib 'D:\SAS\a5_ann1\lib'; 
libname indata 'D:\SAS\a5_ann1\indata'; 
Dm 'log;clear;out;clear';

data b0;set lib.task2data;
***** demographic;
id=seqn;
if riagendr=2 then sex=0;*female;
else sex=riagendr;
age=ridageyr;
age1=RIDAGEMN/12;
race=ridreth1;
if dmdhredu>5 then edu=.;else edu=dmdhredu;
if edu<=3 then edulevel=1;else if edu=4 then edulevel=2;else if edu=5 then edulevel=3;
incomeratio=indfmpir;
if incomeratio>1 then incomeratio1=1;else if incomeratio>0 then incomeratio1=0;
keep id sex age age1 race edu edulevel incomeratio incomeratio1;

***** examination;
bmi=bmxbmi;
height=bmxht;
waist=bmxwaist;
whtr=waist/height;
keep bmi whtr;

***** laboratory -GHB;
hba1c_per=lbxgh; * percentage;
hba1c=(lbxgh-2.15)*10.929; *mmol/mol;
keep hba1c;

***** laboratory -glu;
fpg=lbdglusi; *mmol/L; *2015-16 FPG data need to cabrilate on account of the new machine;
fasthr=phafsthr+phafstmn/60; *hour; 
fasthr0=phafsthr;
keep fpg fasthr fasthr0;

***** laboratory -ogtt;
twohrPG=lbdgltsi; *mmol/L; 
keep twohrPG;

***** laboratory ecq;
if ecd070a>100 then ecd070a=.;
if ecd070b>100 then ecd070b=.;
tempo=(ecd070a*16+ecd070b)*28.3495; * pound and ounce transfer to gram; 
birthwt=round(tempo,0.1);
if birthwt=0 then birthwt=.;
if ecq020=1 then smoke=1;else if ecq020=2 then smoke=0;
if 0<=birthwt<2500 then birthwtlevel=1;
else if 2500<=birthwt<4000 then birthwtlevel=2;
else if 4000<=birthwt then birthwtlevel=3;
if birthwtlevel=. then do;
 if ecq080=2 then birthwtlevel=1;
 else if ecq090=1 then birthwtlevel=3;
 else if ecq080=1 and ecq090=2 then birthwtlevel=2;
end;
keep birthwt smoke birthwtlevel;

***** questionnaire -diabetes;
if diq010=1 then diabete=1;else if diq010=2 or diq010=3 then diabete=0;
if diq010=3 then prediabete=1;else if diq010=2 or diq010=1 then prediabete=0;
keep diabete prediabete;

*****other;
if fpg>=7 or twohrpg>=11.1 or hba1c>=48 then diabete1=1;
else if 5.6<=fpg<7 or 7.8<=twohrpg<11.1 or 39<=hba1c<48 then prediabete1=1;
else do; diabete1=0;prediabete1=0;end;
keep diabete1 prediabete1;
proc sort;by id;run;

data b1;set b0;run;
data b2;set b1;if hba1c=. or fpg=. or twohrpg=. or birthwt=. then delete;run;
data b3;set b2;run;
data b4;set b3;if diabete=1 then delete;run;
data b5;set b4;
if prediabete=1 or prediabete1=1 then prediabete=1;if prediabete^=.;
proc sort;by sex age;run;
proc means data=b5 mean noprint;by sex age;var bmi;output out=b6 mean=bmi1;run;
data b7;set b6;drop _type_ _freq_;run;
proc means data=b5 mean noprint;by sex age;var bmi;output out=b6 std=bmi2;run;
data b8;set b6;drop _type_ _freq_;run;
data c0;merge b5 b7 b8;by sex age;run;
data c1;set c0;
if whtr>0.5 then waist=1;else if whtr>0 then waist=0;
bmip=(bmi-bmi1)/bmi2;
if -999<bmip<-1.645 then bmilevel=1;
else if -1.645<=bmip<1.036 then bmilevel=2;
else if 1.036<=bmip<1.645 then bmilevel=3;
else if 1.645<=bmip then bmilevel=4;
if bmilevel=2 then bmi0=1;else if bmilevel^=. then bmi0=0;
if edulevel=2 then edu0=1;else if edulevel^=. then edu0=0;
if race=3 then race0=1;else if race^=. then race0=0;

if sex=1 then do;
  if 12<=age<13 then do;
     if 0<bmi<15.2 then bmif=1;
	 else if 15.2<=bmi<21.4 then bmif=2;
	 else if 21.4<=bmi<24.8 then bmif=3;
	 else if 24.8<=bmi then bmif=4;
  end;
  if 13<=age<14 then do;
     if 0<bmi<15.7 then bmif=1;
	 else if 15.7<=bmi<22.3 then bmif=2;
	 else if 22.3<=bmi<25.7 then bmif=3;
	 else if 25.7<=bmi then bmif=4;
  end;
  if 14<=age<15 then do;
     if 0<bmi<16.2 then bmif=1;
	 else if 16.2<=bmi<23.1 then bmif=2;
	 else if 23.1<=bmi<26.5 then bmif=3;
	 else if 26.5<=bmi then bmif=4;
  end;
  if 15<=age<16 then do;
     if 0<bmi<16.8 then bmif=1;
	 else if 16.8<=bmi<23.8 then bmif=2;
	 else if 23.8<=bmi<27.3 then bmif=3;
	 else if 27.3<=bmi then bmif=4;
  end;
end;
else if sex=0 then do;
  if 12<=age<13 then do;
     if 0<bmi<15.1 then bmif=1;
	 else if 15.21<=bmi<22.2 then bmif=2;
	 else if 22.2<=bmi<25.8 then bmif=3;
	 else if 25.8<=bmi then bmif=4;
  end;
  if 13<=age<14 then do;
     if 0<bmi<15.6 then bmif=1;
	 else if 15.6<=bmi<22.9 then bmif=2;
	 else if 22.9<=bmi<26.7 then bmif=3;
	 else if 26.7<=bmi then bmif=4;
  end;
  if 14<=age<15 then do;
     if 0<bmi<16.1 then bmif=1;
	 else if 16.1<=bmi<23.7 then bmif=2;
	 else if 23.7<=bmi<27.7 then bmif=3;
	 else if 27.7<=bmi then bmif=4;
  end;
  if 15<=age<16 then do;
     if 0<bmi<16.6 then bmif=1;
	 else if 16.6<=bmi<24.3 then bmif=2;
	 else if 24.3<=bmi<28.5 then bmif=3;
	 else if 28.5<=bmi then bmif=4;
  end;
end;
drop bmi1 bmi2;
proc sort;by prediabete;run;

data data_for_analysis;set c1;run;
data lib.data_for_analysis;set data_for_analysis;run;

proc export data=data_for_analysis
            outfile= "D:\SAS\a5_ann1\output\data_for_analysis.csv" 
            dbms=csv
            replace;
run;

