#!/bin/bash

set -eu

#
# Creates the cloud formation stack
# Lambda function + ApiGateway endpoint
#

aws cloudformation create-stack \
                    --stack-name swiftLambdaTemplate \
                    --template-body file://CloudFormation/template.yaml \
                    --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND
