// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
      .iOS(.v16)
    ],
    products: [
      .library(name: "TDependency", targets: ["TDependency"]),
      .library(name: "TNetwork", targets: ["TNetwork"]),
      .library(name: "TCommon", targets: ["TCommon"]),
      .library(name: "TRoot", targets: ["TRoot"])
    ],
    dependencies: [
      .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.43.0"),
      .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI", from: "2.2.1"),
    ],
    targets: [
      .target(
        name: "TCommon",
        dependencies: [
          .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
          .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI"),
          ]
//        resources: [
//          .process("Resources")
//        ]
      ),
      .target(
        name: "TDependency",
        dependencies: [
          "TCommon",
          "TNetwork"
          ]
      ),
      .target(
        name: "TNetwork",
        dependencies: [
          "TCommon"
          ]
      ),
      .target(
        name: "TRoot",
        dependencies: [
          "TCommon",
          "TNetwork",
          "TDependency"
        ]
      )
    ]
)
