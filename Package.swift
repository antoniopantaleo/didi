// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Didi",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "Didi",
            targets: ["Didi"]
        ),
        .library(
            name: "Didi-Swinject",
            targets: ["Didi-Swinject"]
        ),
        .library(
            name: "Didi-Factory",
            targets: ["Didi-Factory"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.0.0"),
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "Didi",
            swiftSettings: .approachableConcurrency
        ),
        .target(
            name: "Didi-Swinject",
            dependencies: [
                "Didi",
                .product(name: "Swinject", package: "Swinject")
            ],
            swiftSettings: .approachableConcurrency
        ),
        .target(
            name: "Didi-Factory",
            dependencies: [
                "Didi",
                .product(name: "FactoryKit", package: "Factory"),
            ],
            swiftSettings: .approachableConcurrency
        ),
        .testTarget(
            name: "DidiTests",
            dependencies: ["Didi"],
            swiftSettings: .approachableConcurrency
        ),
        .testTarget(
            name: "Didi-SwinjectTests",
            dependencies: [
                "Didi",
                "Didi-Swinject",
                .product(name: "Swinject", package: "Swinject")
            ],
            swiftSettings: .approachableConcurrency
        ),
        .testTarget(
            name: "Didi-FactoryTests",
            dependencies: [
                "Didi",
                "Didi-Factory",
                .product(name: "Factory", package: "Factory")
            ],
            swiftSettings: .approachableConcurrency
        ),
    ]
)

fileprivate extension [SwiftSetting] {
    static var approachableConcurrency: [SwiftSetting] {
        [
            .defaultIsolation(MainActor.self),
            .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
            .enableUpcomingFeature("InferIsolatedConformances")
        ]
    }
}
