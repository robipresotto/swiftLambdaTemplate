#!/bin/bash

set -eu

echo "Renaming project..."
sed -i '' "s/swift-lambda-template/$1/" ./Package.swift
sed -i '' "s/swift-lambda-template/$1/" ./CloudFormation/template.yaml

echo "Saving config on file..."
echo -e """
projectName=$1
awsProfile=$2

export projectName
export awsProfile
""" > ./Scripts/.config
