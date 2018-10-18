#!/bin/bash

curl "http://localhost:4741/practices/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "practice": {
      "id": "'${ID}'"
    }
  }'

echo
