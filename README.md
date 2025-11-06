# VLCKit-iOS

This repository provides a **Swift Package Manager (SPM)** compatible wrapper for the [VLCKit framework](https://code.videolan.org/videolan/VLCKit) for iOS.

VLCKit is the official multimedia framework developed by VideoLAN, but it is not directly compatible with SPM.
  
This repository solves that limitation by hosting the precompiled `.xcframework` version of VLCKit and making it available through Swift Package Manager.

---

## 📦 Installation

To use this package in your iOS project, add it through **Swift Package Manager**:

1. In Xcode, go to **File > Add Packages...**
2. Enter the repository URL:
   ```
   https://github.com/Moral-Apps/vlckit-ios.git
   ```
3. Choose the latest release and add it to your target.

Xcode will automatically download the precompiled `.xcframework` from the release assets and link it to your project.

---

## ⚙️ How It Works

When you add this package, SwiftPM downloads the `.zip` file containing `VLCKit.xcframework` from the release corresponding to the selected version tag.  
Once unzipped, it makes the framework available for import in your Swift project:

```swift
import VLCKit
```

---

## 🧩 Notes

- This project does **not** modify or redistribute VLCKit — it simply provides a convenient way to integrate it via SPM.
- You must comply with the original [VideoLAN licensing terms](https://www.videolan.org/legal.html).
- The releases will be updated periodically to include new versions of the official VLCKit framework.

---

## 🪪 License

VLCKit is licensed under the **LGPLv2.1**.  
See the [VideoLAN legal page](https://www.videolan.org/legal.html) for more details.