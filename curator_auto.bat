:: Simple script to launch curator automatically every day

@echo off

echo -----------------------------------------
echo Script curator auto : starting.
echo.

echo Deleting indices... Calling curator_sauv.py
curator_sauv.py delete --older-than N -p "" >> curator_debug.txt
echo Indices deleted...
echo.

echo Script curator auto : completed.
echo -----------------------------------------
