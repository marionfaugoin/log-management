log-management
==============

Solutions for the log management, internship.


curator
==============

Auto Delete of Indices in ElasticSearch

You can find it here: https://github.com/elasticsearch/curator

REQUIREMENTS
- Python for Windows
- IDLE (to edit .py files)

FILES
- curator_sauv.py : the script to execute daily to cleanse indices. (indice name format: DD-MM-YYYY)
- curator.py : the script to execute daily to cleanse indices. (indice name format: YYYY-MM-DD)
- curator_base.py : the script to execute daily to cleanse indices. (indice name format: logstash-YYYY-MM-DD)

COMMAND LINES
To delete indices older than N days: from the curator directory
~ curator delete --older-than N

Note : the -p "" is not necessary for the curator.py script because it has been modified to forget any prefix to suit our needs.

HELP AND SUPPORT
At any time, curator -h or curator COMMAND -h
Support: https://github.com/elasticsearch/curator

(c) @untergeek

I don't own elasticsearch-curator, I simply modified a bit the python code to adapt it to my needs. 

Comments/forks appreciated :)


windows scripts
==============

compression_script.bat

This allows compression with 7za (7-zip command line executable) http://downloads.sourceforge.net/sevenzip/7za920.zip to zip in 7z your folders if they are 90 days old. (you can change this in the batch script)

extraction_script.bat

This asks the user running the script for parameters, and will extract the correct day selected, and unzip it into a directory chosent by the user.
