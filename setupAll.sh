#!/usr/bin/env bash
set -e

export PYTHONIOENCODING=utf8

if [ -z "$ACCOUNT_ID" ]
then
    echo "You must specify a valid ACOUNT_ID. Usage:"
    echo "ACCOUNT_ID=<account id> [AWS_PROFILE=<user profile>] ./setupAll.sh"
    exit 1
fi

aws iam create-role --role-name lambda-cli-role --assume-role-policy-document file://trust-policy.json
aws iam attach-role-policy --role-name lambda-cli-role \
                    --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

echo "### Waiting for Role to be usable ###"
sleep 10

cd Java
./setup.sh
cd ../Python
./setup.sh
