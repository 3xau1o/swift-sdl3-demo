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
            name: "libsdl"
        ),
        .systemLibrary(
            name: "libcurl",
            providers: [
                .apt(["libcurl4-openssl-dev"]),
                .brew(["curl"]),
            ]
        ),

        .target(
            name: "Sample",
            dependencies: [
                .target(name: "libcurl"),
                .target(name: "libsdl"),
            ]),
    ]
)
