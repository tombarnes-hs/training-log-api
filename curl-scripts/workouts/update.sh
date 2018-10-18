#!/bin/bash

curl --include --request PATCH "http://localhost:4741/workouts/${ID}" \
  --header "Content-Type: application/json" \
  --data '{
    "workout": {
      "notes": "'"${NOTES}"'"
    }
  }'
