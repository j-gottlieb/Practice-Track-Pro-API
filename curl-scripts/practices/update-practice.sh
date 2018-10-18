#!/bin/bash

curl "http://localhost:4741/practices/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "practice": {
      "duration": "'"${DURATION}"'",
      "date": "'"${DATE}"'"
    }
  }'

echo
