// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "DIDI",
    products: [
        .library(
            name: "DIDI",
            targets: ["DIDI"]
        ),
        .library(
            name: "DIDI-Swinject",
            targets: ["DIDI-Swinject"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "DIDI",
            swiftSettings: .approachableConcurrency
        ),
        .target(
            name: "DIDI-Swinject",
            dependencies: [
                "DIDI",
                .product(name: "Swinject", package: "Swinject")
            ],
            swiftSettings: .approachableConcurrency
        ),
        .testTarget(
            name: "DIDITests",
            dependencies: ["DIDI"],
            swiftSettings: .approachableConcurrency
        ),
        .testTarget(
            name: "DIDI-SwinjectTests",
            dependencies: [
                "DIDI",
                "DIDI-Swinject",
                .product(name: "Swinject", package: "Swinject")
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
