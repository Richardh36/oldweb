sitemap=open("sitemap.xml","w")
sitemap.write("<?xml version=\"1.0\" encoding=\"utf-8\"?>")
sitemap.write("<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">")
placelist=open("list.txt","r")
import os
directory=os.listdir("keywords")
for file in directory:
	for place in iter(placelist):
		place=place.rstrip()
		sitemap.write("<url>")
		sitemap.write("<loc>http://www.agilenetworking.co.uk/"+file+"-"+place+".html</loc>")
		sitemap.write("</url>")
	placelist.seek(0)
sitemap.write("</urlset>")
sitemap.close()
