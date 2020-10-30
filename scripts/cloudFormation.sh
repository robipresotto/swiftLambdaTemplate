#!/bin/bash

set -eu

#
# Creates the cloud formation stack
# Lambda function + ApiGateway endpoint
#

export PROJECT_NAME="${1}-${2}"

aws s3 mb s3://$PROJECT_NAME --profile $2 && \
aws s3 cp ".build/lambda/${1}/${1}.zip" "s3://$PROJECT_NAME/${PROJECT_NAME}.zip" && \

aws cloudformation create-stack \
                    --stack-name $1 \
                    --template-body file://./CloudFormation/template.yaml \
                    --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
                    --profile $2
