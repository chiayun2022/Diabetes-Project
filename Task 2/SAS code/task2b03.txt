libname lib 'D:\SAS\a5_ann1\lib'; 
libname indata 'D:\SAS\a5_ann1\indata'; 
Dm 'log;clear;out;clear';

data a0;set lib.rawdata;if prediabete^=.;run;
***********************;

%macro main(a);
data m1;set m0;if birthwtlevel=1 or birthwtlevel=2;run;

proc logistic data=m1;
    class birthwtlevel (ref='2') &c / param=ref;
    model prediabete (event='1') = &list / lackfit clodds=wald;
ods output GlobalTests=GlobalTests; 
ods output CLoddsWald=test1;
run;
data star1;set GlobalTests;
if Test="Wald";
if 0<=ProbChiSq<0.01 then star1='***';else if 0.01<=ProbChiSq<0.05 then star1='**';else if 0.05<=ProbChiSq<0.10 then star1='*';
keep star1;
run;
data ci1;set test1;
if _n_=1;
Odd1=round(OddsRatioEst,0.01);Ci1=round(LowerCL,0.01);Ci2=round(UpperCL,0.01);
keep odd1 ci1 ci2;run;

data m2;set m0;if birthwtlevel=3 or birthwtlevel=2;run;

proc logistic data=m2;
    class birthwtlevel (ref='2') &c/ param=ref;
    model prediabete (event='1') = &list / lackfit clodds=wald;
ods output GlobalTests=GlobalTests; 
ods output CLoddsWald=test2;
run;
data star2;set GlobalTests;
if Test="Wald";
if 0<=ProbChiSq<0.01 then star2='***';else if 0.01<=ProbChiSq<0.05 then star2='**';else if 0.05<=ProbChiSq<0.10 then star2='*';
keep star2;
run;
data ci2;set test2;
if _n_=1;
Odd2=round(OddsRatioEst,0.01);Ci3=round(LowerCL,0.01);Ci4=round(UpperCL,0.01);
keep odd2 ci3 ci4;run;
data r&a;merge ci1 star1 ci2 star2;run;
%mend;

data m0;set a0;if bmif=1 or bmif=2;run;
%let c= ;
%let list=birthwtlevel age sex race incomeratio edu smoke;
%main(1);
data m0;set a0;if bmif=3 or bmif=4;run;
%let c= ;
%let list=birthwtlevel age sex race incomeratio edu smoke;
%main(2);


data m0;set a0;if 0<whtr<=0.5;run;
%let c= ;
%let list=birthwtlevel age sex race incomeratio edu smoke;
%main(3);
data m0;set a0;if whtr>0.5;run;
%let c= ;
%let list=birthwtlevel age sex race incomeratio edu smoke;
%main(4);

data result2;set r1-r4;run;


data task2T3;set result2;run;
proc export data=task2T3
            outfile= "D:\SAS\a5_ann1\output\task2T3.csv" 
            dbms=csv
            replace;
run;


