# TagLayoutView
TagLayoutViewTagLayoutView is a library made with SwiftUI for easy tag display.
<p align="center">
    <img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platforms" />
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <a href="https://github.com/yotsu12/TagLayoutView/blob/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>
<center>
<img src="TagLayoutView.gif"/>
</center>

## Usage
```swift
struct TagListView: View {
    var body: some View {
        GeometryReader { geometry in
            TagLayoutView(
            ["tagA", "tagB", "tagC"],
            padding: 20,
            parentWidth: geometry.size.width) { tag in
                Text(tag)
                .bold()
                .fixedSize()
                .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                .foregroundColor(Color.green)
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 32).stroke(Color.green, lineWidth: 2.0))
            }.padding(.all, 16)
        }
    }
}
```

## Installation

`TagLayoutView` is available via [Swift Package Manager](https://swift.org/package-manager).

Using Xcode 11, go to `File -> Swift Packages -> Add Package Dependency` and enter [https://github.com/yotsu12/TagLayoutView](https://github.com/yotsu12/TagLayoutView) 