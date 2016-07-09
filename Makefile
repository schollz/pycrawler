PYTHON3=python3.4

rt2:
	echo "Generating URLS"
	cat crawl.log | grep "/m/" | grep -v "trailers/\|pictures/\|?\|quotes/\|reviews/\|news/\|forum.rottentomatoes.com" | sed "s/'//g" | awk 'NF>1{print $$NF}' |  sed 's/\// /g' | awk -F" " '{print "https://www.rottentomatoes.com/m/"$$4}' | sort | uniq > urlsAll
	wc -l urlsAll

rt:
	echo "Generating URLS"
	cat crawl.log | grep "/m/" | grep -v "trailers/\|pictures\|?\|quotes\|reviews\|news" | sed s/\"//g | sed s/,//g | sed 's/\[//g' | awk -F" " '{print $$1}' |  sed 's/\// /g' | awk -F" " '{print "https://www.rottentomatoes.com/m/"$$4}' | sort | uniq > urlsAll	

clean:
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
