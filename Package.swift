// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CommandLineSwiftToolUsesCxx",
    products: [
        .library(
            name: "ForestLib",
            targets: ["ForestLib"]),
        .library(name: "SwiftLib", targets: ["SwiftLib"]),
        .executable(
            name: "SwiftCLITool",
            targets: ["SwiftCLITool"])
    ],
    targets: [
        .target(
            name: "ForestLib",
            exclude: ["CMakeLists.txt"]),
        .target(name: "SwiftLib", exclude: ["CMakeLists.txt"]),
        .executableTarget(
            name: "SwiftCLITool",
            dependencies: ["ForestLib", "SwiftLib"],
            exclude: ["CMakeLists.txt"],
            swiftSettings: [.interoperabilityMode(.Cxx)])
    ],
    cxxLanguageStandard: .cxx17
)
