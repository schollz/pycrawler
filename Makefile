PYTHON3=python3.4

rt:
	echo "Generating URLS"
	cat done | grep "/m/" | grep -v "trailers/\|pictures\|?\|quotes\|reviews\|news" | sed s/\"//g | sed s/,//g | sed 's/\[//g' | awk -F" " '{print $1}' |  sed 's/\// /g' | awk -F" " '{print "https://www.rottentomatoes.com/m/"$4}' | sort | uniq > urlsAll	

aeean:
	rm -rf done
	rm -rf urls
	rm -rf seenurls

test:
	$(PYTHON3) crawl.py -q what-if.xkcd.com

verbose:
	$(PYTHON3) crawl.py what-if.xkcd.com

xkcd:
	$(PYTHON3) crawl.py -q xkcd.com

dropbox:
	$(PYTHON3) crawl.py -q dropbox.com

pep8:
	pep8 *.py

wc:
	grep -v '^ *\(#.*\)\?$$' crawling.py | wc -l
