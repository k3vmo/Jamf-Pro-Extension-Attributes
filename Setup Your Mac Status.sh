#!/bin/sh
#https://github.com/setup-your-mac/Setup-Your-Mac

PLIST_PATH=/Library/Preferences/com.sym_company.plist

if [ -e "$PLIST_PATH" ]; then
    result=`/usr/bin/defaults read "$PLIST_PATH" Setup`
else
    result="Not Present"
fi

/bin/echo "<result>$result</result>"
