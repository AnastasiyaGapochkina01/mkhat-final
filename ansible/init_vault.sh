#!/bin/bash

ROLE_ID=b7729af1-1da2-14f6-89f8-fd218106640c
ANSIBLE_VAULT_SECRET_ID=2129adfb-0794-1d4b-71bd-159845d6610b
export VAULT_ADDR=http://84.201.136.84:8201

DATA='{"role_id": "'"$ROLE_ID"'", "secret_id": "'"$ANSIBLE_VAULT_SECRET_ID"'"}'
export VAULT_TOKEN=$(curl -s --request POST --data "$DATA" $VAULT_ADDR/v1/auth/approle/login | jq -r ".auth.client_token")
