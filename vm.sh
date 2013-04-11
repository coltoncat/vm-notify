#!/bin/bash
#note use of '-' in '-EOF1' - Escapes tab at beginning of lines
# Script to call MWI extentions in CallManager to turn MWI on or off.

if [[ $3 -gt 0 ]] then

CALLFILE=$(cat <<-EOF1
Channel: Local/1000$2
MaxRetries: 1
# Retry in 2 min
RetryTime: 120
WaitTime: 45

Context: default
Extension: wait
Priority: 1

EOF1)

echo "$CALLFILE" >> "/var/spool/asterisk/outgoing"/$(date +%Y%mNaVI%M%S)-$1

else

CALLFILE=$(cat <<-EOF1
Channel: Local/1001$2
MaxRetries: 1
# Retry in 2 min
RetryTime: 120
WaitTime: 45

Context: default
Extension: wait
Priority: 1

EOF1)

echo "$CALLFILE" >> "/var/spool/asterisk/outgoing"/$(date +%Y%mNaVI%M%S)-$1

fi
