#!/bin/bash

URL=$WERCKER_STEP_TOMS_COVERAGE_REPORT_WEBHOOK_URL
CH=$WERCKER_STEP_TOMS_COVERAGE_REPORT_CHANNEL
UN=$WERCKER_STEP_TOMS_COVERAGE_REPORT_USERNAME
FN=$WERCKER_STEP_TOMS_COVERAGE_REPORT_FILENAME

if [ "${CH}" = "" ]; then
    CH="general"
fi

if [ "${UN}" = "" ]; then
    UN="Reporter"
fi
TEXT=`awk -F/n -v ORS='\\\\n' '{print}' $FN`

PAYLOAD='payload={"channel": "#'$CH'", "username": "'$UN'", "text": "```'$TEXT'```", "icon_emoji": ":ghost:" }'

echo "${PAYLOAD}"
curl -X POST --data-urlencode "$PAYLOAD" $URL
