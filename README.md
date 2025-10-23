# Note App Final

A Flutter notes application with internationalization support (English/Arabic) and modern UI design.

## Features

- 📝 Create, edit, and delete notes
- 🌍 Multi-language support (English/Arabic)
- 🎨 Modern UI with Lottie animations
- 📱 Responsive design with ScreenUtil
- 🗂️ Local storage with Hive
- 🎯 MVVM Architecture

## Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Most Used Commands

### Development Commands
```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Run in debug mode
flutter run --debug

# Run in release mode
flutter run --release

# Hot reload (while app is running)
r

# Hot restart (while app is running)
R
```

### Build Commands
```bash
# Build APK for Android
flutter build apk

# Build APK for release
flutter build apk --release

# Build for iOS
flutter build ios

# Build for web
flutter build web
```

### Code Generation Commands
```bash
# Generate localization files
flutter gen-l10n

# Run build runner for code generation
flutter pub run build_runner build

# Run build runner with clean
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes and auto-generate
flutter pub run build_runner watch
```

### Analysis & Testing
```bash
# Analyze code for issues
flutter analyze

# Run tests
flutter test

# Check for outdated packages
flutter pub outdated

# Upgrade packages
flutter pub upgrade
```

### Localization Commands
```bash
# Generate language files (after changing .arb files)
flutter gen-l10n

# To rebuild the Language files run the following command:
flutter pub run build_runner build --delete-conflicting-outputs
```

## Project Structure

```
lib/
├── core/                    # Core functionality
│   ├── language_provider.dart
│   ├── hive_initializer.dart
│   └── repo_initializer.dart
├── data/                    # Data layer
│   ├── models/             # Data models
│   └── repositories/        # Data repositories
├── features/               # Feature modules
│   ├── home/              # Home feature
│   ├── add_note/          # Add note feature
│   └── note_details/      # Note details feature
├── l10n/                  # Localization files
│   ├── app_en.arb         # English translations
│   ├── app_ar.arb         # Arabic translations
│   └── app_localizations.dart
└── widgets/               # Reusable widgets
```

## Technologies Used

- **Flutter**: Cross-platform framework
- **Hive**: Local database
- **Provider**: State management
- **ScreenUtil**: Responsive design
- **Lottie**: Animations
- **Flutter Localizations**: Internationalization

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and analysis
5. Submit a pull request

## License

This project is licensed under the MIT License.
