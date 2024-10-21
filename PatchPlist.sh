#!/bin/bash
set -e

if [[ -z "$1" ]]; then
  echo "Usage: $0 appname"
  exit 1
fi

/usr/libexec/PlistBuddy -c "set :MinimumOSVersion 5.0" Payload/$1.app/Info.plist


zip -r "$1" Payload
rm Payload/

#LEFTOVER:
#install_name_tool \
#  -change /usr/lib/libSystem.B.dylib @executable_path/Frameworks/Sonia.dylib Payload/$2.app/$2 \
#  -add_rpath /usr/lib/libSystem.B.dylib \

