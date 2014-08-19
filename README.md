log-management
==============

Solutions for the log management, internship.


curator
==============

Auto Delete of Indices in ElasticSearch

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
(Thanks @untergeek)
