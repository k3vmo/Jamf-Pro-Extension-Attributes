#!/bin/bash
# The organization required certain process checks while the device was 'on net' 
# In order to get Jamf Pro to execute the policy correctly - this EA reports whether it can reach the LDAP server
# Smart Group was created - and the policy gets scoped to any device reported as 'Online'


test=$(nc -z -G 5 LDAP.HOSTNAME.COM 636 &> /dev/null && echo "Online" || echo "Offline")

if [[ $test = "Online" ]]; then 
	echo "<result>Online</result>"
else 
	echo "<result>Offline</result>"
fi
