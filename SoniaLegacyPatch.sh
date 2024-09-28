#!/bin/bash
set -e

if [[ -z "$1" ]]; then
  echo "Usage: $0 /path/to/decrypted.ipa appname"
  exit 1
fi

unzip $1 Payload/

#P.S: You are free to change the MininumOSVersion to whatever you'd like, only iOS 6 is supported though, so don't expect support.
/usr/libexec/PlistBuddy -c "set :MinimumOSVersion 6.0" Payload/$2.app/Info.plist
if cp .theos/obj/debug/Sonia.dylib .theos/obj/debug/GameController.dylib .theos/obj/debug/Foundation.dylib Payload/$2.app/Frameworks/; then
    echo "Copying DYLIB to Frameworks folder."
else
    mkdir Payload/$2.app/Frameworks/
    cp .theos/obj/debug/Sonia.dylib .theos/obj/debug/GameController.dylib .theos/obj/debug/Foundation.dylib  Payload/$2.app/Frameworks/
fi

install_name_tool \
    -change /System/Library/Frameworks/GameController.framework/GameController @executable_path/Frameworks/GameController.dylib Payload/$2.app/$2 \
    #-change /System/Library/Frameworks/Foundation.framework/Foundation @executable_path/Frameworks/Foundation.dylib \


zip -r "$1" Payload
rm Payload/

#LEFTOVER:
#install_name_tool \
#  -change /usr/lib/libSystem.B.dylib @executable_path/Frameworks/Sonia.dylib Payload/$2.app/$2 \
#  -add_rpath /usr/lib/libSystem.B.dylib \

