// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "VLCKitWrapper",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Expose the binary as a library
        .library(name: "VLCKitWrapper", targets: ["MobileVLCKit"])
    ],
    targets: [
        // Use a local binary target inside the same repo
        .binaryTarget(
            name: "MobileVLCKit",
            path: "Frameworks/MobileVLCKit.xcframework" // <--- committed folder
        ),
        // Dummy target to keep SPM happy if needed (optional)
        .target(
            name: "VLCKitShim",
            dependencies: ["MobileVLCKit"],
            path: "Sources/VLCKitShim"
        )
    ]
)