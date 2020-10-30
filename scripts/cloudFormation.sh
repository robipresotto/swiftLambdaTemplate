#!/bin/bash

set -eu

#
# Creates the cloud formation stack
# Lambda function + ApiGateway endpoint
#

aws s3 mb s3://${1} --profile $2 && \
aws s3 cp ".build/lambda/${1}/${1}.zip" "s3://${1}/${1}.zip" && \

aws cloudformation create-stack \
                    --stack-name $1 \
                    --template-body file://./CloudFormation/template.yaml \
                    --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
                    --profile $2
