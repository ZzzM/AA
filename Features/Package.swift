// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.macOS(.v12)],
    products: [
        .library(name: "Features", targets: ["Features"]),
        .library(name: "Services", targets: ["Services"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sparkle-project/Sparkle", exact: "2.7.0")
    ],
    targets: [
        .target(
            name: "Features",
            dependencies: [.services]
        ),
        .target(
            name: "Services",
            dependencies: [.sparkle]
        )
    ]
)

extension Target.Dependency {
    static let services: Self = "Services"
}

extension Target.Dependency {
    static let sparkle = product(name: "Sparkle", package: "Sparkle")
}
