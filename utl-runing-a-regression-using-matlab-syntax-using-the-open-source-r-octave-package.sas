%let pgm=utl-runing-a-regression-using-matlab-syntax-using-the-open-source-r-octave-package;

CONTENTS

   1 Drop down to MATLAB/OCTAVE
   2 Drop down macro

perplexity AI
please provide a reproducible real world example of running a matlab program in r using the octave package with output

Octave download site
https://octave.org/download

CLONES (FREE)

MATLAB
https://tinyurl.com/33wvvrvm
https://github.com/rogerjdeangelis/utl-runing-a-regression-using-matlab-syntax-using-the-open-source-r-octave-package

SPSS
github
https://tinyurl.com/3rs385x9
https://github.com/rogerjdeangelis/utl-dropping-down-to-spss-using-the-pspp-free-clone-and-running-a-spss-linear-regression

ACROBAT PRO
github
https://tinyurl.com/7wa2s7vf
https://github.com/rogerjdeangelis/utl-forever-free-for-now-pdfgear-edit-split-combine-delete-pages-substitute-for-acrobat-pro

Note octave footprint is over 500mgb.

OCTAVE INTERFACES

Octave supports SQLITE
Octave supports ODBC
R can read and write .mat files using the R.matlab package.
Octave natively can read and write .mat files
Best way to communicate is .mat files?
SAS cannot create or read .mat files

I wonder if there is interest in adding matlab sql examples where the same sql code can run in sas, r, excel and python.?
Good waay to introduce programmers to othe languages?

/**************************************************************************************************************************/
/*          INPUT                          |   PROCESS                                   | OUTPUT                         */
/*          =====                          |   =======                                   | ======                         */
/*  Self contained in octave/matlab script | 1 DROP DOWN TO MATLAB/OCTAVE                |                                */
/*                                         | ============================                |                                */
/*  x = [1:10]';                           |                                             |                                */
/*  y = 2*x + 3 + randn(10,1)*2;           | PRE PROCESS                                 | LOG WINDOW                     */
/*                                         |                                             |                                */
/*  x,y for regression                     | 1 create a restore point                    | Regression (intercept, slope): */
/*                                         |                                             |    2.0804                      */
/*                                         | 2 download octive                           |    2.1782                      */
/*                                         |   https://octave.org/download               | R-squared: 0.95883             */
/*                                         |   I downloaded the exe (510mb)              |                                */
/*                                         |   Install in c:/program files               | OUTPUT WINDOW                  */
/*                                         |                                             |                                */
/*                                         | 3 add to system envionment variables        | Regression (intercept, slope): */
/*                                         |   C:\Program Files\GNU Octave               |    2.0804                      */
/*                                         |      \Octave-10.2.0\mingw64\bin             |    2.1782                      */
/*                                         |                                             | R-squared: 0.95883             */
/*                                         | 4 add macros utl_mbegin utl_mend            |                                */
/*                                         |   to your autocall library.                 |                                */
/*                                         |   macros on end                             |                                */
/*                                         |                                             |                                */
/*                                         |                                             |                                */
/*                                         | RUNCODE                                     |                                */
/*                                         | =======                                     |                                */
/*                                         |                                             |                                */
/*                                         | %utl_mbegin;                                |                                */
/*                                         | parmcards4;                                 |                                */
/*                                         | % Simple linear regression in GNU Octave    |                                */
/*                                         |                                             |                                */
/*                                         | % Clear workspace and close all figures     |                                */
/*                                         | clear;                                      |                                */
/*                                         | close all;                                  |                                */
/*                                         | clc;                                        |                                */
/*                                         |                                             |                                */
/*                                         | % Generate sample data                      |                                */
/*                                         | x = [1:10]';                                |                                */
/*                                         | y = 2*x + 3 + randn(10,1)*2;                |                                */
/*                                         |                                             |                                */
/*                                         | % Perform linear regression                 |                                */
/*                                         | % Design matrix with intercept              |                                */
/*                                         | X = [ones(size(x)) x];                      |                                */
/*                                         | % Regression coefficients (b0, b1)          |                                */
/*                                         | b = X\y;                                    |                                */
/*                                         |                                             |                                */
/*                                         | % Calculate predicted values                |                                */
/*                                         | y_pred = X*b;                               |                                */
/*                                         |                                             |                                */
/*                                         | % Calculate R-squared                       |                                */
/*                                         | SS_total = sum((y - mean(y)).^2);           |                                */
/*                                         | SS_residual = sum((y - y_pred).^2);         |                                */
/*                                         | rsquare = 1 - (SS_residual/SS_total);       |                                */
/*                                         |                                             |                                */
/*                                         | diary "d:/txt/regoutput.txt"                |                                */
/*                                         | % Display results                           |                                */
/*                                         | disp('Regression (intercept, slope):');     |                                */
/*                                         | disp(b);                                    |                                */
/*                                         | disp(['R-squared: ',num2str(rsquare)]);     |                                */
/*                                         | diary off                                   |                                */
/*                                         | ;;;;                                        |                                */
/*                                         | %utl_mend;                                  |                                */
/*                                         |                                             |                                */
/*                                         | 2 DROP DOWN MACRO                           |                                */
/*                                         | =================                           |                                */
/*                                         |                                             |                                */
/*                                         | see below                                   |                                */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

/**************************************************************************************************************************/
/*          INPUT                                                                                                         */
/*          =====                                                                                                         */
/*  Self contained in octave/matlab script                                                                                */
/*                                                                                                                        */
/*  x = [1:10]';                                                                                                          */
/*  y = 2*x + 3 + randn(10,1)*2;                                                                                          */
/*                                                                                                                        */
/*  x,y for regression                                                                                                    */
/**************************************************************************************************************************/

/*---    _                       _                                      _   _ _ _
/ |   __| |_ __ ___  _ __     __| | _____      ___ __   _ __ ___   __ _| |_| (_) |__
| |  / _` | `__/ _ \| `_ \   / _` |/ _ \ \ /\ / / `_ \ | `_ ` _ \ / _` | __| | | `_ \
| | | (_| | | | (_) | |_) | | (_| | (_) \ V  V /| | | || | | | | | (_| | |_| | | |_) |
|_|  \__,_|_|  \___/| .__/   \__,_|\___/ \_/\_/ |_| |_||_| |_| |_|\__,_|\__|_|_|_.__/
                    |_|
PRE PROCESS

1 create a restore point

2 download octive
  https://octave.org/download
  I downloaded the exe (510mb)
  Install in c:/program files

3 add to system envionment variables
  C:\Program Files\GNU Octave
     \Octave-10.2.0\mingw64\bin

4 add macros utl_mbegin utl_mend
  to your autocall library.
  macros on end
---*/

/*---- Useful for testing environment ----*/
%utl_close;
%utlfkil(c:/temp/m_pgm.m);
%utlfkil(c:/temp/m_pgm.log);

%utl_mbegin;
parmcards4;
% Simple linear regression in GNU Octave

% Clear workspace and close all figures
clear;
close all;
clc;

% Generate sample data
x = [1:10]';
y = 2*x + 3 + randn(10,1)*2;

% Perform linear regression
% Design matrix with intercept
X = [ones(size(x)) x];
% Regression coefficients (b0, b1)
b = X\y;

% Calculate predicted values
y_pred = X*b;

% Calculate R-squared
SS_total = sum((y - mean(y)).^2);
SS_residual = sum((y - y_pred).^2);
rsquare = 1 - (SS_residual/SS_total);

diary "d:/txt/regoutput.txt"
% Display results
disp('Regression (intercept, slope):');
disp(b);
disp(['R-squared: ',num2str(rsquare)]);
diary off
;;;;
%utl_mend;

/**************************************************************************************************************************/
/* LOG WINDOW                     |  OUTPUT WINDOW                                                                        */
/*                                |                                                                                       */
/* Regression (intercept, slope): |  Regression (intercept, slope):                                                       */
/*    2.0804                      |     2.0804                                                                            */
/*    2.1782                      |     2.1782                                                                            */
/* R-squared: 0.95883             |  R-squared: 0.95883                                                                   */
/**************************************************************************************************************************/

/*___        _                       _
|___ \    __| |_ __ ___  _ __     __| | _____      ___ __   _ __ ___   __ _  ___ _ __ ___
  __) |  / _` | `__/ _ \| `_ \   / _` |/ _ \ \ /\ / / `_ \ | `_ ` _ \ / _` |/ __| `__/ _ \
 / __/  | (_| | | | (_) | |_) | | (_| | (_) \ V  V /| | | || | | | | | (_| | (__| | | (_) |
|_____|  \__,_|_|  \___/| .__/   \__,_|\___/ \_/\_/ |_| |_||_| |_| |_|\__,_|\___|_|  \___/
                        |_|
*/

filename ft15f001 "c:/oto/utl_mbegin.sas";
parmcards4;
%macro utl_mbegin;
%utl_close;
%utlfkil(c:/temp/m_pgm.m);
%utlfkil(c:/temp/m_pgm.log);
filename ft15f001 "c:/temp/m_pgm.m";
%mend utl_mbegin;
;;;;
run;quit;


filename ft15f001 "c:/oto/utl_mend.sas";
parmcards4;
%macro utl_mend(returnvar=N);
options noxwait noxsync;
filename rut pipe  "octave-cli c:/temp/m_pgm.m > c:/temp/m_pgm.log";
run;quit;
  data _null_;
    file print;
    infile rut recfm=v lrecl=32756;
    input;
    put _infile_;
    putlog _infile_;
  run;
  filename ft15f001 clear;
  * use the clipboard to create macro variable;
  %if %upcase(%substr(&returnVar.,1,1)) ne N %then %do;
    filename clp clipbrd ;
    data _null_;
     length txt $200;
     infile clp;
     input;
     putlog "macro variable &returnVar = " _infile_;
     call symputx("&returnVar.",_infile_,"G");
    run;quit;
  %end;
data _null_;
  file print;
  infile "c:/temp/m_pgm.log" ;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
filename ft15f001 clear;
%mend utl_mend;
;;;;
run;quit;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
