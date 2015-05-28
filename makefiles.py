import os
import string

layout=open("layout.html","r")

directory=os.listdir("content")
for file in directory:
	infile=open("content/"+file,"r")
	title=infile.readline().rstrip()
	description=infile.readline().rstrip()
	keywords=infile.readline().rstrip()
	contentlines=infile.readlines()
	for contentline in contentlines:
		contentline=string.rstrip(string.lstrip(contentline))
	content=''.join(contentlines)
	outfile=open("output/"+file,"w")
	for line in iter(layout):
		outfile.write(line.replace("%CONTENT%",content).replace("%KEYWORDS%",keywords).replace("%DESCRIPTION%",description).replace("%TITLE%",title).lstrip().rstrip())
	layout.seek(0)
	infile.close()
	outfile.close()
layout.close()
