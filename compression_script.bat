@echo off
echo.

:: Cleaning the debug log files
if exist log_compression.txt ( del log_compression.txt )

:: Beginning of the script
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo 		Compression script (using 7za)
echo.

:: This script is to be launched everyday
:: It will compress folders containing logs that are 90 days old. (timeout for indexation in elasticsearch)
:: Requirements: 7za.exe (7-zip command line executable) in the same folder as the script and root folder 
:: of the directories to compress.
:: If all went well, the script will also delete the folder it has just compressed to make room.

:: To get the date it was 90 days (3 months) before ;)
set day=-90
echo >"%temp%\%~n0.vbs" s=DateAdd("d",%day%,now) : d=weekday(s)
echo>>"%temp%\%~n0.vbs" WScript.Echo year(s)^& right(100+month(s),2)^& right(100+day(s),2)
for /f %%a in ('cscript /nologo "%temp%\%~n0.vbs"') do set "result=%%a"
del "%temp%\%~n0.vbs"
set "YYYY=%result:~0,4%"
set "MM=%result:~4,2%"
set "DD=%result:~6,2%"
set "data=%yyyy%-%mm%-%dd%"
echo 90-days-ago's date: %data%

:: To get the date at a proper format for creating archives
FOR /f %%a in ('WMIC OS GET LocalDateTime ^| find "."') DO set DTS=%%a
set mydate=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%
echo Today's date: %mydate%
echo.

:: To get 90-days-ago's date and today's date in a proper format for comparison
for /F "tokens=1-3 delims=- " %%a in ("%data%") do (
   set new_data=%%a%%b%%c
)
for /F "tokens=1-3 delims=- " %%a in ("%mydate%") do (
   set new_date=%%a%%b%%c
)
echo 90-days-ago's date new format: %new_data%
echo Today's date new format: %new_date%
echo.

echo Compressing files in the folder %new_data%...
:: The compression command line
:: a is to add files
:: -t7z is to change the output format
:: -mx9 is to get ultra compressed data
:: -r is to get all subdirectories recursively and convert the architecture in the .7z
7za a -t7z d:\Archives\log-archive-%new_data%.7z d:\%new_data%\* -mx9 -r >> log_compression.txt
:: End of the command line
echo.
echo Compression completed successfully :) check the debug file if necessary.
echo.

:: Delete the files that were just compressed.
:: Check errorlevel
:: If all went right (no compression failure, etc...) files will be deleted.
:: Otherwise they won't.
echo Now trying to delete the files to make room.
if %ERRORLEVEL%==0 ( rd %new_data% /S /Q ) else ( echo Directory could not be deleted errorlevel/=0 )
echo Files deleted with success.

:: End of the script
echo.
echo 		Compression script completed.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
