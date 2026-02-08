# Pharmacio Flutter Project - Mobile

## 1. Project Overview

**Pharmacio** is a smart pharmacy management system supporting both **Web and Mobile (Flutter)** platforms.  
It is designed to:

- Manage inventory and product tracking
- Handle purchase orders from warehouses
- Display smart notifications
- Support multi-language (Arabic / English)
- Integrate AI-powered analysis for PDF/image files (OCR)

---

## 2. Getting Started

### 2.1 Requirements
- Flutter >= 3.35.4
- Dart >= 3.9.2
- FVM (Flutter Version Manager)
- Android Studio or VS Code
- Emulator or physical device (Android / iOS)

### 2.2 Clone the Project
```bash
git clone https://github.com/georgeAlNa/pharmacio-mobile.git
cd pharmacio_flutter_mobile
```

### 2.3 Install FVM (if not installed)
```bash
dart pub global activate fvm
```

> Ensure that the path below is added to your system PATH:
```
C:\Users\<username>\AppData\Local\Pub\Cache\bin
```

### 2.4 Set Project Flutter Version (execute at the root of project)
```bash
fvm use 3.35.4
```

### 2.5 Install Dependencies
```bash
fvm flutter pub get
```

### 2.6 Run the Project
```bash
fvm flutter run
```

> **Important:** Always use `fvm flutter` for Flutter commands to ensure consistent versioning.

---

## 3. Code Guidelines

### 3.1 Colors
Use colors from:
```dart
AppColors.nameOfColor
```
> Do not use `Colors.whatever` directly.

### 3.2 TextStyle
Use text styles from:
```dart
AppTextStyles.nameOfStyle
```

### 3.3 Strings
All static strings should be placed in:
```dart
AppStrings
```

### 3.4 Images
All image paths should be defined in:
```dart
images
```

### 3.5 API Endpoints
All API URLs should be placed in:
```dart
AppLinkUrl
```

### 3.6 ScreenUtil
Use `ScreenUtil` for all widgets to support responsive layouts:
```dart
Container(
  width: 100.w,
  height: 50.h,
)
```

### 3.7 Spacing
Use spacing helpers from `spacing.dart`:
```dart
verticalSpace(10),
horizontalSpace(20),
```

### 3.8 Navigation
Use context extensions from `extensions.dart`:
```dart
context.navigateTo(Routes.nameOfScreen)
```

### 3.9 Public Widgets
Leverage reusable widgets from the **public widget folder** to reduce duplication.

### 3.10 Routes
Always add new pages in:
```dart
routes.dart
app_router.dart
```

---

## 5. Best Practices

1. Do **not** use hardcoded values for colors, text styles, strings, images, or API URLs.
2. Use `ScreenUtil` for all UI widgets.
3. Reuse widgets from the public widgets folder whenever possible.
4. Always add new pages to `routes.dart` and `app_router.dart`.
5. Use `fvm flutter` for all Flutter commands to ensure consistent versioning.

---

## 6. Additional Notes

- Always run `fvm flutter clean` before building if you encounter issues:
```bash
fvm flutter clean
fvm flutter pub get
```
- Follow Git branching strategy: create a branch per feature before merging into `main`.
- Review routes and navigation extensions when adding new pages.
