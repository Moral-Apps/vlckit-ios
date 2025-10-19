#!/bin/sh
#
TMP_DIR="tmp"
rm -rf "$TMP_DIR/" || true

TAG_VERSION="3.6.0"
IOS_URL="https://download.videolan.org/pub/cocoapods/prod/MobileVLCKit-3.6.0-c73b779f-dd8bfdba.tar.xz"
MACOS_URL="https://download.videolan.org/pub/cocoapods/prod/VLCKit-3.6.0-c73b779f-dd8bfdba.tar.xz"
TVOS_URL="https://download.videolan.org/cocoapods/prod/TVVLCKit-3.6.0-c73b779f-dd8bfdba.tar.xz"

mkdir "$TMP_DIR/"

wget -O "$TMP_DIR/MobileVLCKit.tar.xz" $IOS_URL
tar -xf "$TMP_DIR/MobileVLCKit.tar.xz" -C "$TMP_DIR/"

wget -O "$TMP_DIR/VLCKit.tar.xz" $MACOS_URL
tar -xf "$TMP_DIR/VLCKit.tar.xz" -C "$TMP_DIR/"

wget -O "$TMP_DIR/TVVLCKit.tar.xz" $TVOS_URL
tar -xf "$TMP_DIR/TVVLCKit.tar.xz" -C "$TMP_DIR/"

IOS_LOCATION="$TMP_DIR/MobileVLCKit-binary/MobileVLCKit.xcframework"
TVOS_LOCATION="$TMP_DIR/TVVLCKit-binary/TVVLCKit.xcframework"
MACOS_LOCATION="$TMP_DIR/VLCKit - binary package/VLCKit.xcframework"

xcodebuild -create-xcframework \
    -framework "$MACOS_LOCATION/macos-arm64_x86_64/VLCKit.framework" \
    -debug-symbols "${PWD}/$MACOS_LOCATION/macos-arm64_x86_64/dSYMs/VLCKit.framework.dSYM" \
    -framework "$TVOS_LOCATION/tvos-arm64_x86_64-simulator/TVVLCKit.framework" \
    -debug-symbols "${PWD}/$TVOS_LOCATION/tvos-arm64_x86_64-simulator/dSYMs/TVVLCKit.framework.dSYM" \
    -framework "$TVOS_LOCATION/tvos-arm64/TVVLCKit.framework"  \
    -debug-symbols "${PWD}/$TVOS_LOCATION/tvos-arm64/dSYMs/TVVLCKit.framework.dSYM" \
    -framework "$IOS_LOCATION/ios-arm64_i386_x86_64-simulator/MobileVLCKit.framework" \
    -debug-symbols "${PWD}/$IOS_LOCATION/ios-arm64_i386_x86_64-simulator/dSYMs/MobileVLCKit.framework.dSYM" \
    -framework "$IOS_LOCATION/ios-arm64_armv7_armv7s/MobileVLCKit.framework" \
    -debug-symbols "${PWD}/$IOS_LOCATION/ios-arm64_armv7_armv7s/dSYMs/MobileVLCKit.framework.dSYM" \
    -output "$TMP_DIR/VLCKit.xcframework"

ditto -c -k --sequesterRsrc --keepParent "$TMP_DIR/VLCKit.xcframework" "$TMP_DIR/VLCKit.xcframework.zip"

PACKAGE_HASH=$(sha256sum "$TMP_DIR/VLCKit.xcframework.zip" | awk '{ print $1 }')
#PACKAGE_STRING="Target.binaryTarget(name: \"VLCKit\", url: \"https:\/\/github.com\/moralapps\/vlckit-ios\/releases\/download\/$TAG_VERSION\/VLCKit.xcframework.zip\", checksum: \"$PACKAGE_HASH\")"
echo "Binary hash: $PACKAGE_HASH"
#sed -i '' -e "s/let vlcBinary.*/let vlcBinary = $PACKAGE_STRING/" Package.swift
