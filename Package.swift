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
            url: "https://github.com/xtravision-ai/xtravision-swift-framework/releases/download/v1.0.5/XtraVisionAI.xcframework.zip",
            checksum: "99d994318fa56db7bda487578f8b1f8f33205a0fbde0beffd9e68e21fc14c02d"
        )
    ]
)
