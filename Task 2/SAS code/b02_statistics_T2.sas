libname lib 'D:\SAS\a5_ann1\lib'; 
libname indata 'D:\SAS\a5_ann1\indata'; 
Dm 'log;clear;out;clear';

data c1;set lib.data_for_analysis;if prediabete^=.;run;
***********************;
proc means data=c1 mean noprint;by prediabete;var age sex race0 edu0 incomeratio1 smoke bmif waist;output out=c2 mean=;run;
proc sort data=c1;by prediabete birthwtlevel;run;
proc means data=c1 n noprint;class prediabete birthwtlevel;var sex;output out=c3 n=;run;
proc sort data=c1;by prediabete race;run;
proc means data=c1 n noprint;by prediabete race;var sex;output out=c4 n=;run;
proc sort data=c1;by prediabete bmilevel;run;
proc means data=c1 n noprint;by prediabete bmif;var sex;output out=c5 n=;run;
proc sort data=c1;by prediabete edu;run;
proc means data=c1 n noprint;by prediabete edu;var sex;output out=c6 n=;run;
proc sort data=c1;by prediabete smoke;run;
proc means data=c1 n noprint;by prediabete smoke;var sex;output out=c7 n=;run;

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

data m0;set c1;run;
%let c= ;

%let list=birthwtlevel age sex race incomeratio edu smoke;
%main(1);
%let list=birthwtlevel age sex race incomeratio edu smoke bmi;
%main(2);
%let list=birthwtlevel age sex race incomeratio edu smoke whtr;
%main(3);

data m0;set c1;if sex=1;run;
%let c= ;

%let list=birthwtlevel age race incomeratio edu smoke;
%main(4);
%let list=birthwtlevel age race incomeratio edu smoke bmi;
%main(5);
%let list=birthwtlevel age race incomeratio edu smoke whtr;
%main(6);


data m0;set c1;if sex=0;run;
%let c= ;

%let list=birthwtlevel age race incomeratio edu smoke;
%main(7);
%let list=birthwtlevel age race incomeratio edu smoke bmi;
%main(8);
%let list=birthwtlevel age race incomeratio edu smoke whtr;
%main(9);

data result;set r1-r9;run;

data task2T2;set result;run;
proc export data=task2T2
            outfile= "D:\SAS\a5_ann1\output\task2T2.csv" 
            dbms=csv
            replace;
run;



