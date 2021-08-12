#!/usr/bin/env bash
set -e

zip testLambda.zip testLambda.py  > /dev/null

aws lambda create-function --function-name pythonLocalStorage --zip-file fileb://testLambda.zip \
      --handler testLambda.lambda_handler --runtime python3.8 \
      --role arn:aws:iam::${ACCOUNT_ID}:role/lambda-cli-role \
      --timeout 30
