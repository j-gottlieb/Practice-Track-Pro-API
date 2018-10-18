#!/bin/bash

curl "http://localhost:4741/practices/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \
  '{
    "practice": {
      "id": "'${ID}'"
    }
  }'

echo
