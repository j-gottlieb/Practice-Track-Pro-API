#!/bin/bash

curl "http://localhost:4741/goals" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "goal": {
      "daily": "'"${DAILY}"'",
      "weekly": "'"${WEEKLY}"'",
      "monthly": "'"${MONTHLY}"'"
    }
  }'

echo
