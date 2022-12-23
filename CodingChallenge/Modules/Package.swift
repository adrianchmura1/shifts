// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "Shifts",
            targets: ["Shifts", "ShiftsDomain", "ShiftsData"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ShiftsDomain",
            dependencies: [],
            path: "Sources/Domain/ShiftsDomain"
        ),
        .target(
            name: "ShiftsData",
            dependencies: ["ShiftsDomain"],
            path: "Sources/Data/ShiftsData"
        ),
        .target(
            name: "Shifts",
            dependencies: ["ShiftsDomain"],
            path: "Sources/Presentation/Shifts"
        ),
        .testTarget(
            name: "DataTests",
            dependencies: ["ShiftsData"]),
        .testTarget(
            name: "DomainTests",
            dependencies: ["ShiftsDomain"]),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Shifts"]),
    ]
)
