#!/bin/bash

curl "http://localhost:4741/workouts/${ID}" \
--include \
--request PATCH \
--header "Authorization: Token token=${TOKEN}" \
--header "Content-Type: application/json" \
  --data '{
    "workout": {
      "notes": "'"${NOTES}"'"
    }
  }'
