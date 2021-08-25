// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TokenField",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "TokenField",
            targets: ["TokenField"]),
    ],
    targets: [
        .target(
            name: "TokenField",
            dependencies: []),
        .testTarget(
            name: "TokenFieldTests",
            dependencies: ["TokenField"]),
    ]
)
