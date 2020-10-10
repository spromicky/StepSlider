// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "StepSlider",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "StepSlider", targets: ["StepSlider"])
    ],
    targets: [
        .target(name: "StepSlider")
    ]
 )