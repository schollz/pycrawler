# pycrawler

`python3 crawl.py --help`

Get data from nohup.out using

	cat nohup.out | grep 'WORD' | grep -v '?' | awk '{print  $NF}' | sed "s/'//g" | sort | uniq  | wc -l
