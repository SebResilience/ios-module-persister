// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ios-module-persister",
    platforms: [.iOS(.v13)],

    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PersisterProtocol",
            targets: ["PersisterProtocol"]),

        .library(
            name: "RealmPersister",
            targets: ["RealmPersister"]),
    ],

    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", from: "10.19.0"),
        .package(url: "https://github.com/ResilienceCare/companion-ios-module-core.git", branch: "develop")
    ],

    targets: [
        .target(
            name: "PersisterProtocol",
            dependencies: [.product(name: "CoreModule", package: "companion-ios-module-core")]),

        .target(
            name: "RealmPersister",
            dependencies: ["PersisterProtocol",
                .product(name: "RealmSwift", package: "realm-swift")]),

        .testTarget(
            name: "ios-module-persisterTests",
            dependencies: ["RealmPersister"]),
    ]
)
