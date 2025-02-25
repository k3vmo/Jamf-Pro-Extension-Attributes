#!/bin/bash

FILE_PATH=/Library/Security/PolicyBanner.rtfd

if [ ! -e "$FILE_PATH" ]; then
	result="Not Present"
fi

if [ -e "$FILE_PATH" ]; then
	result=`pkgutil --pkg-info com.DOMAIN.pkg.PolicyBanner | grep version | /usr/bin/awk '{ print $2 }'`
fi

/bin/echo "<result>$result</result>"
