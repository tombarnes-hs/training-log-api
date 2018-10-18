#!/bin/bash

curl "http://localhost:4741/workouts/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}" \
