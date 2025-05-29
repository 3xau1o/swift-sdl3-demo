// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Sample",
    products: [
        .executable(name: "Sample", targets: ["Sample"])
    ],
    targets: [
        .systemLibrary(
            name: "SDL"
        ),
        .target(
            name: "Sample",
            dependencies: [
                .target(name: "SDL")
            ]),
    ]
)
