#!/bin/bash

curl 'http://localhost:4741/workouts' \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \
