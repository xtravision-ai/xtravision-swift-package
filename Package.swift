// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "xtravision-swift-package",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "XtraVisionAI",
            targets: ["XtraVisionAI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "XtraVisionAI",
            url: "https://github.com/xtravision-ai/xtravision-swift-framework/releases/download/v1.0.3/XtraVisionAI.xcframework.zip",
            checksum: "fcd4ffb9d6872acac24590d8b122427c7ad7ccac4ad38a3b08f6d1c158de46ac"
        )
    ]
)
