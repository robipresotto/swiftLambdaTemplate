#!/bin/bash

set -eu

if [ -d ".build" ]
then
  rm -rf .build
fi