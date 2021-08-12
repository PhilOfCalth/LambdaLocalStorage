#!/usr/bin/env bash

aws iam detach-role-policy --role-name lambda-cli-role \
                        --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole
aws iam delete-role --role-name lambda-cli-role

cd Java
./tearDown.sh
cd ../Python
./tearDown.sh
