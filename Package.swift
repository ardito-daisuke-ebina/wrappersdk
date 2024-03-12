// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.



import PackageDescription


let package = Package(
    name: "EbinaFramework",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "EbinaFramework",
            targets: ["EbinaframeworkWrapper"])    // <--- reference the wrapper here
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .target(
            name: "EbinaframeworkWrapper",         // <--- new wrapper
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .target(name: "EbinaFramework")    // <-- reference the actual binary target here
            ],
            path: "Sources/wrappersdk",
            publicHeadersPath: ""
        ),
        .binaryTarget(
            name: "EbinaFramework",
            path: "EbinaFramework.xcframework")
    ])
