@echo off
echo.

:: Cleaning the debug log files
if exist log_extraction.txt ( del log_extraction.txt )

:: Beginning of the script
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo 		Extraction script (using 7za)
echo.

:: This script will ask a date to extract log files from to the user
:: And it will extract them in the directory specified by the user.

echo Which date do you want to extract the archive for ?
set /p date_input="Please enter a date: (YYYYMMdd) "
echo You chose date : %date_input%
echo.

echo Where do you want your files to be extracted ?
echo (By default files will be created under: YourDirectoryInput/logs-%date_input%/)
set /p directory_input="Please enter a valid directory: (YourInputDirectory=d:\test\extractions for instance) "
echo You chose directory : %directory_input%
echo.

echo Extracting archive for : %date_input%
:: The compression command line
:: x is to extract full paths
:: -o{Directory} is to change the output directory
:: -y tells your computer that you answer yes to every question, including overwritting files if they already exist.
7za -y x d:\Archives\log-archive-%date_input%.7z -o%directory_input%\logs-%date_input% -r >> log_extraction.txt
:: End of the command line
echo.
echo Script completed successfully :) check the debug file if necessary.

:: End of the script
echo.
echo 		Extraction script completed.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
