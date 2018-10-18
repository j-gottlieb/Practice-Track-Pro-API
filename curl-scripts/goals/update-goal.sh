#!/bin/bash

curl "http://localhost:4741/goals/${ID}" \
  --include \
  --request PATCH \
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
