:: Very simple script
:: This will help converting .evt files into .tsv for logstash.

echo Beginning %date% %time% : Conversion script for .evt files
echo Starting Log Parser 2.2...
call logparser "select * into Path_To_tsv_file/name.tsv from Path_To_evt_files/name.evt"
echo End %date% %time% : Conversion script for .evt files
