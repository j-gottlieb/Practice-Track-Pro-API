#!/bin/bash

curl "http://localhost:4741/practices" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
