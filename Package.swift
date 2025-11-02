// swift-tools-version: 5.9
import PackageDescription

let vlcFramework = Target.binaryTarget(name: "VLCKitFramework", url: "https://github.com/Moral-Apps/vlckit-ios/releases/download/v0.0.3/VLCKit.xcframework.zip", checksum: "0e758e6418cb68ab1cb85417fc72ee6cddfb7a7caa0ccd18ed5d8d0c53f5194a")

let package = Package(
    name: "vlckit-ios",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "VLCKit",
            targets: ["VLCKit"]),
    ],
    dependencies: [],
    targets: [
        vlcFramework,
        .target(
            name: "VLCKit",
            dependencies: [
                .target(name: "VLCKitFramework")
            ]),
    ]
)