#!/bin/bash

set -eu

# deploy the lambda function to aws
aws lambda update-function-code --function $1 --zip-file "fileb://.build/lambda/$1/$1.zip" --profile=$2 --publish
