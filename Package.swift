// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "TCMPPSDK",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TCMPPSDK",
            targets: ["TCMPPSDKWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/CoderMJLee/MJRefresh.git", from: "3.7.9"),
        .package(url: "https://github.com/ZipArchive/ZipArchive.git", .upToNextMinor(from: "2.4.3")),
        .package(url: "https://github.com/TCMPP-Team/Brotli.git", from: "1.1.0"),
        .package(url: "https://github.com/TCMPP-Team/PromiseObjC.git", from: "0.7.1"),
        .package(url: "https://github.com/TCMPP-Team/SocketRocket.git", from: "0.5.1"),
        .package(url: "https://github.com/TCMPP-Team/Tars.git", from: "1.6.0"),
    ],
    targets: [
        .binaryTarget(
            name: "TCMPPSDK",
            url: "https://tmf-warehouse-1314481471.cos.ap-beijing.myqcloud.com/tcmpp/ios-sdk/noshark/TCMPPSDK/2.2.15.2/2/TCMPPSDK_2.2.15.2.xcframework.zip",
                        checksum: "bdea6d9740cadb61306c3aa557aae93c8b4e2143f6976a6dd305ea99f0abad27"
        ),
        .target(
            name: "TCMPPSDKWrapper",
            dependencies: [
                "TCMPPSDK",
                .product(name: "MJRefresh", package: "MJRefresh"),
                .product(name: "ZipArchive", package: "ZipArchive"),
                .product(name: "Brotli", package: "Brotli"),
                .product(name: "PromiseObjC", package: "PromiseObjC"),
                .product(name: "SocketRocket", package: "SocketRocket"),
                .product(name: "Tars", package: "Tars"),
            ],
            resources: [.process("TMFMiniAppSDK.bundle")]
        )
    ]
)
