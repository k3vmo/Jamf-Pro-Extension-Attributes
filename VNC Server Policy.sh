#!/bin/bash
#Replace DOMAIN with the org name of the package

PACKAGE=`pkgutil --packages | grep com.DOMAIN.pkg.VNCServerPolicy`

if [ "$PACKAGE" == "" ]; then
	result="Not Present"
fi

if [ "$PACKAGE" != "" ]; then
	result=`pkgutil --pkg-info com.highmark.pkg.VNCServerPolicy | grep version | /usr/bin/awk '{ print $2 }'`
fi

#

VERSION=`/usr/bin/sw_vers | /usr/bin/grep ProductVersion | /usr/bin/awk '{print $2}'`

if [ "${VERSION:0:2}" == "10" ]; then
	/bin/ln -sf /usr/lib/libgssapi_krb5.dylib /etc/vnc/ssolib
else
	/bin/ln -sf /usr/lib/sasl2/libgssapiv2.2.so /etc/vnc/ssolib
fi

#

/bin/echo "<result>$result</result>"
