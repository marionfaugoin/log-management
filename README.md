log-management
==============

Solutions for the __log management__, internship 2014.

### requirements
- Logstash (1.4.2)
- Elasticsearch (1.2.1)
- Kibana (3.1.0)
- Java (1.7.0)
- Ruby (1.7.0)
- A centralized server that collects log files.

This will present you some tips to __improve your log collection__.

The curator is by [__untergeek__](http://github.com/untergeek).

The windows scripts were written by __me__ thanks to help found online.

See the [__wiki__](https://github.com/marionfaugoin/log-management/wiki) for more information on what will be added next.

# curator

Auto delete of indices in ElasticSearch

You can find it here: https://github.com/elasticsearch/curator

### requirements
- Python for Windows
- IDLE (to edit .py files)

### files
- curator_sauv.py : the script to execute daily to cleanse indices. (indice name format: DD-MM-YYYY)
- curator.py : the script to execute daily to cleanse indices. (indice name format: YYYY-MM-DD)
- curator_base.py : the script to execute daily to cleanse indices. (indice name format: logstash-YYYY-MM-DD)

### command line
To delete indices __older than N days__: from the curator directory
~ curator delete --older-than N

Note : the -p "" is not necessary for the curator.py script because it has been modified to forget any prefix to suit our needs.

### help and support
At any time, __curator -h__ or curator COMMAND -h
Support: https://github.com/elasticsearch/curator

(c) @untergeek

I don't own __elasticsearch-curator__, I simply modified a bit the python code to adapt it to my needs. 

# windows scripts

## compression_script.bat

This allows compression with 7za (__7-zip command line executable__) http://downloads.sourceforge.net/sevenzip/7za920.zip to zip in 7z your folders if they are 90 days old. (you can change this in the batch script)

## extraction_script.bat

This asks the user running the script for parameters, and will extract the __correct day selected__, and unzip it into a directory chosent by the user.

# windows event logs

### conversion_evt.bat

This script uses __Log Parser 2.2__ to convert .evt in .tsv to be taken into account by Logstash. You just have to change the paths and you're good to go :) This is useful isf you already have all your logs at the same spot, and it will prevent you from having to get them at the source (meaning on __each__ server, which is redundant...).
