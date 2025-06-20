#!/bin/bash

CALL_ID=$1
CALLER=$2
CALLED=$3
START_TIME="$4"
END_TIME="$5"
RECORDING_FILENAME=$6
STATUS=$7

RECORDING_URL="https://YOUR_BUCKET.s3.YOUR_REGION.amazonaws.com/${RECORDING_FILENAME}"

mysql -u root -pYOUR_PASSWORD asterisk <<EOF
INSERT INTO call_history (
    call_id, caller_id, receiver_id, start_time,
    end_time, status, recording_filename, recording_s3_url
) VALUES (
    '${CALL_ID}', '${CALLER}', '${CALLED}', '${START_TIME}',
    '${END_TIME}', '${STATUS}', '${RECORDING_FILENAME}', '${RECORDING_URL}'
);
EOF
