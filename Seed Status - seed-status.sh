#!/bin/bash
#To show whether user is currently enrolled in AppleSeed beta
SEED_PROGRAM=$(/System/Library/PrivateFrameworks/Seeding.framework/Resources/seedutil current | /usr/bin/grep "Currently enrolled in:" | /usr/bin/awk '{ print $4 }')

case $SEED_PROGRAM in

    "(null)")
        result="Not Enrolled"
        ;;
        
    *)
        result="$SEED_PROGRAM"
        ;;
        
esac

/bin/echo "<result>$result</result>"
