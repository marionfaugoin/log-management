@echo off

:: Cleaning the debug log files
if exist log_evt_conversion.txt ( del log_evt_conversion.txt)

echo.
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo 		Conversion from .evt to .tsv
echo This script is to be launched automatically every day.
echo.

:: This script is for every windows event logs of every server.
:: It has to be scheduled to run every day.
:: It will work on the logs of the day before and turn them into .tsv for logstash.

:: To get the date it was yesterday
set day=-1
echo >"%temp%\%~n0.vbs" s=DateAdd("d",%day%,now) : d=weekday(s)
echo>>"%temp%\%~n0.vbs" WScript.Echo year(s)^& right(100+month(s),2)^& right(100+day(s),2)
for /f %%a in ('cscript /nologo "%temp%\%~n0.vbs"') do set "result=%%a"
del "%temp%\%~n0.vbs"
set "YYYY=%result:~0,4%"
set "MM=%result:~4,2%"
set "DD=%result:~6,2%"
set "data=%yyyy%-%mm%-%dd%"
echo yesterday it was %data%


:: To get the date at a proper format (YYYYMMDD) for Log Parser searches
for /F "tokens=1-3 delims=- " %%a in ("%data%") do (
   set new_data=%%a%%b%%c
)
echo yesterday's date in proper format! %new_data%
echo.

:: For Application EventLogs
echo Application: Starting Log Parser 2.2...
call logparser "select * into '//Server/Directory/%new_data%/Machine/Event Log/application.tsv' from 'Server/Directory/%new_data%/Machine/Event Log/Application.evt' "
echo Log Parser has finished!
echo.

:: For Security EventLogs
echo Security: Starting Log Parser 2.2...
call logparser "select * into 'Server/Directory/%new_data%/Machine/Event Log/security.tsv' from 'Server/Directory/%new_data%/Machine/Event Log/Security.evt' "
echo Log Parser has finished!
echo.

:: For System EventLogs
echo System: Starting Log Parser 2.2...
call logparser "select * into 'Server/Directory/%new_data%/Machine/Event Log/system.tsv' from 'Server/Directory/%new_data%/Machine/Event Log/System.evt' "
echo Log Parser has finished!
echo.

echo 		Conversion script over :)
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
