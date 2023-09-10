<div align="center">
  <img width="100" height="100" alt="CoreSession" src="https://github.com/yusasarisoy/SwiftPress/assets/30107357/b789ffce-dba6-40ec-8eed-ca9d67b03d2d">
  </br>
  <h1><b>SwiftPress</b></h1>
</div>

<div align="center">

![](https://img.shields.io/badge/Editor-Xcode-informational?style=flat&logo=xcode&logoColor=white&color=FC3F1B) ![](https://img.shields.io/badge/Language-Swift-informational?style=flat&logo=swift&logoColor=white&color=FC3F1B)

</div>

SwiftPress is a versatile Swift Package Manager designed to streamline your development process on Apple platforms. It provides a collection of extensions and utilities for Foundation, UIKit, and other essential frameworks, making it easier than ever to build robust applications.

## Features

- 🚀 Efficient and speedy delivery of Swift extensions and resources.
- 🧰 Comprehensive set of tools and utilities for Apple platform developers.
- 🔌 Seamless integration with Swift Package Manager for hassle-free use.
- 📚 Well-documented and easy to get started with.
- ⚙️ Highly customizable to suit your specific project requirements.

## Installation

To integrate this package into your Swift project, you can use the Swift Package Manager (SPM).

### Xcode Integration

1. Open your Xcode project.

2. Navigate to the `File > Add Packages...`.

3. In the text field that appears, enter the URL of this repository:

    ```markdown
    https://github.com/yusasarisoy/SwiftPress

4. Choose the version or branch you want to use on `Dependency Rule` section. It is preferable to stick to the `main` branch.

5. Choose the SwiftPress and click the `Add Package` button.

6. Finally, click the `Add Package` button in the pop-up to add the package to your project.

### Package.swift Integration

You can also add SwiftPress to your `Package.swift` file by adding the following dependency:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/SwiftPress.git", from: "1.0.0")
],
targets: [
    .target(name: "YourApp", dependencies: ["SwiftPress"]),
]
