// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
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
        .target(
            name: "Ludo",
            dependencies: [
                .target(name: "SDL3")
            ]),
    ]
)
