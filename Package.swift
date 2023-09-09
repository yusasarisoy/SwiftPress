// swift-tools-version: 5.8
// Specifies the Swift Tools version this package is compatible with.

import PackageDescription

let package = Package(
  name: "SwiftPress",
  products: [
    .library(
      name: "SwiftPress", // The name of the library product.
      targets: [
        "SwiftPress" // The target(s) that make up this product.
      ]
    ),
  ],
  dependencies: [], // List of package dependencies (none in this case).
  targets: [
    .target(
      name: "SwiftPress", // The name of the target module.
      dependencies: [] // List of module dependencies (none in this case).
    ),
    .testTarget(
      name: "SwiftPressTests", // The name of the test target.
      dependencies: [
        "SwiftPress" // The module(s) being tested.
      ]
    )
  ]
)
