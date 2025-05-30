// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Ludo",
    products: [
        .executable(name: "Ludo", targets: ["Ludo"])
    ],
    targets: [
        .systemLibrary(
            name: "SDL3"
        ),
        .target(
            name: "Ludo",
            dependencies: [
                .target(name: "SDL3")
            ]),
    ]
)
