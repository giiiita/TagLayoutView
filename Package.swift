// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "TagLayoutView",
    platforms: [
      .iOS(.v13)
    ],
    products: [
        .library(
            name: "TagLayoutView",
            targets: ["TagLayoutView"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TagLayoutView",
            dependencies: [])
    ]
)
