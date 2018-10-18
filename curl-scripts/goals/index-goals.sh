#!/bin/bash

curl "http://localhost:4741/goals" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
