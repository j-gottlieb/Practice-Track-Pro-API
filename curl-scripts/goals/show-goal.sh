#!/bin/bash

curl "http://localhost:4741/goals/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \
  '{
    "goal": {
      "id": "'${ID}'"
    }
  }'

echo
