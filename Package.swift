// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "DIDI",
    products: [
        .library(
            name: "DIDI",
            targets: ["DIDI"]
        ),
    ],
    targets: [
        .target(
            name: "DIDI",
            swiftSettings: .approachableConcurrency
        ),
        .testTarget(
            name: "DIDITests",
            dependencies: ["DIDI"],
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
