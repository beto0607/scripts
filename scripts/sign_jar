#!/bin/bash

# Script for signing APKs
# Parameters: Keystore file path, APK file path, keystore

if [ $# -lt 3 ]
then
    echo "Error, parameters needed are: Keystore file path, APK file path, keystore"
    exit 1
fi
#jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore android-boemiz.keystore.jks app-release-unsigned.apk boemiz
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $1 $2 $3 
