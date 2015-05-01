placelist=open("list.txt","r")
import os
directory=os.listdir("keywords")
for file in directory:
	template=open("keywords\\"+file,"r")
	for place in iter(placelist):
		place=place.rstrip()
		placefile=open("pages\\"+file+"-"+place+".html","w")
		for line in iter(template):
			placefile.write(line.replace("PLACENAMEHERE",place))
		placefile.close()
		template.seek(0)
	template.close()
	placelist.seek(0)
placelist.close()