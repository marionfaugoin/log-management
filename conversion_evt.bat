echo Beginning %date% %time% : Conversion script for .evt files
echo Starting Log Parser 2.2...
call logparser "select * into C:/Fichiers_tests/system_tsv.tsv from C:/Fichiers_tests/system.evt"
echo End %date% %time% : Conversion script for .evt files
