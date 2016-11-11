#! /bin/bash




#####################################################################################################
function update_android_sdk {
  android update sdk --no-ui
}

function install_android_sdk {
  brew install ant maven gradle android-sdk android-ndk
  update_android_sdk
}

dep "Android SDK" bin=android install=install_android_sdk update=update_android_sdk
