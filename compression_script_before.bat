@echo off
echo.

:: Beginning of the script
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo 		Compression script (using 7za)
echo.

:: This script is for catching up on compressing folders.
:: It will compress folders from datechoice to a specified date (here 20140524)
:: Requirements: 7za.exe (7-zip command line executable) in the same folder as the script and root folder 
:: of the directories to compress.

set datechoice=20140522
echo %datechoice%

:: The script is a basic one. It will increment the dates but will consider them as integers.
:: This means that you have to stop on the 30 or 31 to make a month with the specified date below. (20140524)

:while
echo %datechoice%
if %datechoice% EQU 20140524 ( goto :ending )
7za a -t7z d:\EOD_Logs\Archives\log-archive-%datechoice%.7z d:\EOD_Logs\%datechoice%\* -mx9 -r
set /a datechoice+=1
goto :while

:ending
echo this is the end... hold your breath and count to ten... :(

:: End of the script
echo.
echo 		Compression script completed.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
