#! /bin/bash




#####################################################################################################
function install_android_sdk {
  brew install ant maven gradle android-sdk android-ndk
  android update sdk --no-ui
}

dep "Android SDK" bin=android install=install_android_sdk
