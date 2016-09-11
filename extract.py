import json
a = set()
with open('crawl.log','r') as f:
	for line in f:
		for item in line.split():
			if 'rottentomatoes.com' in item:
				item = item.replace("'","")
				item = item.replace("?","/")
				urlSplit = item.split('/')
				if len(urlSplit) > 4:
					a.add(urlSplit[4])

with open("crawl.list","w") as f:
	for item in a:
		f.write("http://www.rottentomatoes.com/m/%s/\n" % item)
