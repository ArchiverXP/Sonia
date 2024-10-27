# Sonia
An API extension for iOS 6! WIP.


WARNING: THIS IS MORE SO A POC, THIS API EXTENSION IS VERY UNSTABLE!!!!


Compatibility list:

RedBall 4: Gets ingame and DOESN'T CRASH(‼️), still need to work on the GameController part but it works! 👍


Where's my Perry: Haven't tested it throughly yet, but as of the latest commit, gets ingame!

PPAP: Gets in game, but once your bullet reaches the top, it crashes with KERN_INVALID_ADDRESS at 0x00000000.


HOW TO USE:

First, either download the latest dylibs from Releases or compile them yourself.

Then, you extract the ipa file in the same folder where the sh files are.

Then, you put your downloaded/compiled dylibs in the root folder where Sonia resides.

Now, you have to patch the ReSoniaDylib.dylib file to export from libSystem.B, this can be done with PatchDylib.sh.

Then, Patch your IPA with the SoniaLegacyPatch.sh file, supply both the extracted ipa file name.

Use Theos to compile.

NOTE: THIS IS MAC ONLY!! This is because of install_name_tool.

You can use a Hackintosh or a VM though, that's what I do.
