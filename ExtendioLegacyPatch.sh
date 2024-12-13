#!/bin/bash
set -e

if [[ -z "$1" ]]; then
  echo "Usage: $0 appname_payload_extracted"
  exit 1
fi

#P.S: You are free to change the MininumOSVersion to whatever you'd like, only iOS 6 is supported though, so don't expect support.
/usr/libexec/PlistBuddy -c "set :MinimumOSVersion 6.0" Payload/$1.app/Info.plist
if cp .theos/obj/debug/GameController.dylib Payload/$1.app/Frameworks/; then
    echo "Copying DYLIB to Frameworks folder."
else
    mkdir Payload/$1.app/Frameworks/
    cp .theos/obj/debug/GameController.dylib Payload/$1.app/Frameworks/
fi


if cp ReExtendioDylib.dylib Payload/$1.app/iExtendio/; then
    echo "Copying DYLIB to Frameworks folder."
else
    mkdir Payload/$1.app/iExtendio/
    cp ReExtendioDylib.dylib Payload/$1.app/Extendio/
fi

install_name_tool \
    -change /System/Library/Frameworks/GameController.framework/GameController @executable_path/Frameworks/GameController.dylib Payload/$1.app/$1 \
    -change /usr/lib/libSystem.B.dylib @executable_path/iExtendio/ReExtendioDylib.dylib \
    
zip -r "$1" Payload
rm Payload/
