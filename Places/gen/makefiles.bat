@echo off
setlocal EnableDelayedExpansion

set defaultkeyword=IT and Computer Networking Support

for /f "tokens=*" %%A in (list.txt) do (
	if exist pages\%%A.html del pages\%%A.html

	echo %%A

	for /f "tokens=* delims= " %%a in (page.html) do (
		set str=%%a
		set str=!str:PLACENAMEHERE=%%A!
		set str=!str:KEYWORDHERE=%defaultkeyword%!
		echo !str! >> pages\%%A.html
	)
)


DIR keywords /B > keywords.txt


for /f "tokens=*" %%A in (list.txt) do (
	for /f "tokens=*" %%B in (keywords.txt) do (

		if exist pages\%%B-%%A.html del pages\%%B-%%A.html

		echo %%A - %%B

		for /f "tokens=* delims= " %%a in (keywords\%%B) do (
			set str=%%a
			set str=!str:PLACENAMEHERE=%%A!
			echo !str! >> pages\%%B-%%A.html
		)
	)
)