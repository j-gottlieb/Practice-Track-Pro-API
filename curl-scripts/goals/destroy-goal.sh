#!/bin/bash

curl "http://localhost:4741/goals/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "goal": {
      "id": "'${ID}'"
    }
  }'

echo
