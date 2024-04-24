// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CommandLineSwiftToolUsesCxx",
    products: [
        .library(
            name: "forestLib",
            targets: ["forestLib"]),
        .executable(
            name: "swiftCLITool",
            targets: ["swiftCLITool"])
    ],
    targets: [
        .target(
            name: "forestLib"),
        .executableTarget(
            name: "swiftCLITool",
            dependencies: ["forestLib"],
            swiftSettings: [.interoperabilityMode(.Cxx)])
    ],
    cxxLanguageStandard: .cxx17
)
