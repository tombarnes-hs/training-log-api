#!/bin/bash

curl --include --request POST 'http://localhost:4741/workouts' \
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
