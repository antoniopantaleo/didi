// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Didi",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v4),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "Didi", targets: ["Didi"])
    ],
    targets: [
        .target(
            name: "Didi",
            swiftSettings: .approachableConcurrency
        ),
        .testTarget(
            name: "DidiTests",
            dependencies: ["Didi"],
            swiftSettings: .approachableConcurrency
        )
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
