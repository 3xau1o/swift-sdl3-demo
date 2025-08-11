// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Ludo",
    products: [
        .executable(name: "Ludo", targets: ["Ludo"])
    ],
    targets: [
        // https://github.com/swiftlang/swift-package-manager/blob/main/Documentation/Usage.md#requiring-system-libraries
        .systemLibrary(
            name: "SDL3",
            pkgConfig: "sdl3"
        ),
        .executableTarget(
            name: "Ludo",
            dependencies: [
                .target(name: "SDL3"),
            ],
            resources: [.process("Resources")],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
    ]
)
