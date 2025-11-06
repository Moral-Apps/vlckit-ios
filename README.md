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

---

## ⚙️ How It Works

When you add this package, SwiftPM downloads the `.zip` file containing `VLCKit.xcframework` from the release corresponding to the selected version tag.  
Once unzipped, it makes the framework available for import in your Swift project:

```swift
import VLCKit
```

---

## 🔄 Updating the VLCKit Framework

If a new version of **VLCKit** is released, you can update this repository to include it by following these steps:

1. Open a terminal and navigate to the `Scripts` folder within this repository.
2. Run the script:
   ```bash
   ./generate-vlc-kit.sh
   ```
3. The script will:
   - Download the latest **VLCKit** frameworks for iOS, macOS, and tvOS.
   - Merge them into a single `.xcframework`.
   - Create a zipped file and display its SHA256 checksum in the terminal.
   - Generate a temporary folder `tmp` inside the `Scripts` directory containing the generated files.

4. Open `Package.swift` and update:
   - The **URL** to point to the new release (only update the version number in the URL).
   - The **checksum** value with the new hash printed by the script.

5. Commit and push your changes.

6. Create a new **tag** matching the version of the updated VLCKit.

7. Go to GitHub → this repository → **Releases** → create a new release using the new tag, and upload the generated `.zip` file.

8. Once uploaded, you can now use the new version in your main project.

9. Finally, delete the temporary `tmp` folder inside the `Scripts` directory to clean up.

## 🧩 Notes

- This project does **not** modify or redistribute VLCKit — it simply provides a convenient way to integrate it via SPM.
- You must comply with the original [VideoLAN licensing terms](https://www.videolan.org/legal.html).
- The releases will be updated periodically to include new versions of the official VLCKit framework.

---

## 🪪 License

VLCKit is licensed under the **LGPLv2.1**.  
See the [VideoLAN legal page](https://www.videolan.org/legal.html) for more details.