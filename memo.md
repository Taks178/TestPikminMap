


Quick start

In a normal Xcode project
If you're building an app using an Xcode project, the easiest way to add package dependencies is in the File menu. Search for the package using the repository URL: https://github.com/maplibre/swiftui-dsl.

In a Swift package
Add the following to the main dependencies section of your Package.swift.

    .package(url: "https://github.com/maplibre/swiftui-dsl", branch: "main"),
Then, for each target add either the DSL (for just the DSL) or both (for the SwiftUI view):

    .product(name: "MapLibreSwiftDSL", package: "swiftui-dsl"),
    .product(name: "MapLibreSwiftUI", package: "swiftui-dsl"),





MapLibreを利用するため以下のパッケージをインストールする
URL and click Add Package
https://github.com/maplibre/swiftui-dsl

MapLibre を SwiftUI で使用する場合、UIViewRepresentable を使ってラッパーを作成する必要があります。ただし、MapLibreSwiftUI を利用している場合は、既に SwiftUI 用のラッパーが提供されているため、MapView を直接使用できます。
→MapLibreSwiftUIを使用する。

import MapLibreはエラーになった。
→プロジェクトの設定で、Frameworks, Libraries, and Embedded Content の箇所に
　パッケージが指定されていなかった。



PikminBloomMap/
├── PikminBloomMapApp.swift   // アプリのエントリポイント
├── ContentView.swift         // メインのSwiftUIビュー
├── SimpleMap.swift           // MapLibreをラップするUIViewRepresentable
├── Resources/                // リソースファイル（画像やJSONなど）
└── SupportingFiles/          // サポートファイル（Info.plistなど）


