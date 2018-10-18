#!/bin/bash

curl 'http://localhost:4741/workouts' \
  --include \
  --request POST \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "workout": {
      "date": "'"${DATE}"'",
      "elapsed_time": "'"${TIME}"'",
      "average_watts": "'"${WATTS}"'",
      "average_hr": "'"${HR}"'",
      "pre_fatigue": "'"${PRE_FATIGUE}"'",
      "post_fatigue": "'"${POST_FATIGUE}"'",
      "notes": "'"${NOTES}"'"
    }
  }'
