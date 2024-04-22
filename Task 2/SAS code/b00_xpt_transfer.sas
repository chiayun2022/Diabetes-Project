libname lib 'D:\SAS\a5_ann1\lib'; 

*********************************************************;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\demo_d.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\demo_e.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\demo_f.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\demo_g.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\demo_h.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\demo_i.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;

data demo;set demo_d demo_e demo_f demo_g demo_h demo_i;run;
data lib.demo;set demo;run;

*********************************************************;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\bmx_d.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\bmx_e.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\bmx_f.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\bmx_g.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\bmx_h.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\bmx_i.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;

data bmx;set bmx_d bmx_e bmx_f bmx_g bmx_h bmx_i;run;
data lib.bmx;set bmx;run;

*********************************************************;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ecq_d.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ecq_e.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ecq_f.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ecq_g.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ecq_h.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ecq_i.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;

data ecq;set ecq_d ecq_e ecq_f ecq_g ecq_h ecq_i;run;
data lib.ecq;set ecq;run;


*********************************************************;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ghb_d.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ghb_e.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ghb_f.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ghb_g.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ghb_h.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ghb_i.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;

data ghb;set ghb_d ghb_e ghb_f ghb_g ghb_h ghb_i;run;
data lib.ghb;set ghb;run;


*********************************************************;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\glu_d.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\glu_e.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\glu_f.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\glu_g.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\glu_h.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\glu_i.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;

data glu;set glu_d glu_e glu_f glu_g glu_h glu_i;run;
data lib.glu;set glu;run;

*********************************************************;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ogtt_d.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ogtt_e.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ogtt_f.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ogtt_g.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ogtt_h.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\ogtt_i.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;

data ogtt;set ogtt_d ogtt_e ogtt_f ogtt_g ogtt_h ogtt_i;run;
data lib.ogtt;set ogtt;run;


*********************************************************;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\fastqx_d.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\fastqx_e.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\fastqx_f.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\fastqx_g.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\fastqx_h.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\fastqx_i.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;

data fastqx;set fastqx_d fastqx_e fastqx_f fastqx_g fastqx_h fastqx_i;run;
data lib.fastqx;set fastqx;run;

*********************************************************;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\diq_d.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\diq_e.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\diq_f.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\diq_g.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\diq_h.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;
libname xptfile xport 'D:\SAS\a5_ann1\xpt\diq_i.xpt' access=readonly;
proc copy inlib=xptfile outlib=work;run;

data diq;set diq_d diq_e diq_f diq_g diq_h diq_i;run;
data lib.diq;set diq;run;

***** demographic;
data a1;set lib.demo;
keep seqn riagendr ridageyr ridagemn ridreth1 dmdhredu indfmpir;
proc sort;by seqn;run; 

***** examination;
data a2;set lib.bmx;
keep seqn bmxbmi bmxht bmxwaist;
proc sort;by seqn;run; 

***** laboratory -GHB;
data a3;set lib.ghb;
keep seqn lbxgh;
proc sort;by seqn;run; 

***** laboratory -glu;
data a4;set lib.glu;
keep seqn lbdglusi phafsthr phafstmn phafsthr;
proc sort;by seqn;run; 

***** laboratory -ogtt;
data a5;set lib.ogtt;
keep seqn lbdgltsi;
proc sort;by seqn;run; 

***** laboratory ecq;
data a6;set lib.ecq;
keep seqn ecd070a ecd070b ecq020 ecq080 ecq090;
proc sort;by seqn;run; 

***** questionnaire -diabetes;
data a7;set lib.diq;
keep seqn diq010;
proc sort;by seqn;run; 

data task2_original_data;merge a1-a7;by seqn;run; 
data lib.task2data;set task2_original_data;run;

proc export data=task2_original_data
            outfile= "D:\SAS\a5_ann1\output\task2_original_data.csv" 
            dbms=csv
            replace;
run;
