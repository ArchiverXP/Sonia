#!/bin/bash
set -e

if [[ -z "$1" ]]; then
  echo "Usage: $0 appname"
  exit 1
fi

/usr/libexec/PlistBuddy -c "set :MinimumOSVersion 5.0" Payload/$1.app/Info.plist


zip -r "$1" Payload
rm Payload/
