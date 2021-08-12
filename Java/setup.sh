#!/usr/bin/env bash

mvn clean package

aws lambda create-function --function-name javaLocalStorage --zip-file fileb://target/lambda-local-storage-java-1.0-SNAPSHOT.jar \
    --handler poc.TestLambda::handleRequest \
    --runtime java11 --role arn:aws:iam::${ACCOUNT_ID}:role/lambda-cli-role --timeout 300
