// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
      .iOS(.v16)
    ],
    products: [
      .library(name: "TDependency", targets: ["TDependency"]),
      .library(name: "TCommon", targets: ["TCommon"]),
      .library(name: "TRoot", targets: ["TRoot"])
    ],
    dependencies: [
      .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.43.0"),
    ],
    targets: [
      .target(
        name: "TCommon",
        dependencies: [
          .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
          ]
//        resources: [
//          .process("Resources")
//        ]
      ),
      .target(
        name: "TDependency",
        dependencies: [
          "TCommon"
          ]
      ),
      .target(
        name: "TRoot",
        dependencies: [
          "TCommon",
          "TDependency"
        ]
      )
    ]
)
