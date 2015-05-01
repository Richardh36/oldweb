@echo off

echo ^<?xml version="1.0" encoding="utf-8"?^> >> sitemap.xml
echo ^<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"^> >> sitemap.xml

for /f "tokens=*" %%A in (list.txt) do (
	echo ^<url^> >> sitemap.xml
	echo ^<loc^>http://www.agilenetworking.co.uk/Places/%%A.html^</loc^> >> sitemap.xml
	echo ^</url^> >> sitemap.xml
)


DIR keywords /B > keywords.txt


for /f "tokens=*" %%A in (list.txt) do (
	for /f "tokens=*" %%B in (keywords.txt) do (
		echo ^<url^> >> sitemap.xml
		echo ^<loc^>http://www.agilenetworking.co.uk/Places/%%B-%%A.html^</loc^> >> sitemap.xml
		echo ^</url^> >> sitemap.xml
	)
)

echo ^</urlset^> >> sitemap.xml