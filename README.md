# Notie App

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
├── 📁 core/                    # Core application functionality
│   ├── language_provider.dart  # Language state management
│   ├── repo_initializer.dart   # Repository initialization
│   └── 📁 storage/             # Storage layer
│       ├── hive_initializer.dart    # Hive database setup
│       ├── hive_utils.dart          # Generic Hive utilities
│       └── hive_registrar.g.dart    # Generated Hive adapters
│
├── 📁 data/                    # Data layer (Clean Architecture)
│   ├── 📁 models/             # Data models
│   │   └── 📁 note/          # Note entity
│   │       ├── note.dart           # Note model
│   │       ├── note.freezed.dart   # Generated Freezed code
│   │       └── note.g.dart         # Generated Hive adapter
│   └── 📁 repositories/        # Data repositories
│       └── note_repository.dart    # Notes data access
│
├── 📁 features/               # Feature-based modules
│   ├── 📁 home/              # Home screen feature
│   │   ├── home_screen.dart         # Home UI
│   │   ├── home_view_model.dart     # Home business logic
│   │   └── 📁 widgets/              # Feature-specific widgets
│   │       ├── add_note_icon.dart
│   │       ├── empty_state_widget.dart
│   │       ├── home_drawer.dart
│   │       ├── note_card.dart
│   │       └── notes_list.dart
│   │
│   ├── 📁 add_note/          # Add note feature
│   │   ├── add_note_screen.dart     # Add note UI
│   │   ├── add_note_view_model.dart # Add note logic
│   │   └── 📁 widgets/              # Feature-specific widgets
│   │       └── color_picker.dart
│   │
│   ├── 📁 note_details/      # Note details feature
│   │   └── note_details_screen.dart # Note details UI
│   │
│   └── 📁 on_boarding/       # Onboarding feature
│       └── on_boarding_screen.dart  # Onboarding UI
│
├── 📁 shared/                 # Shared application components
│   └── 📁 widgets/           # Reusable UI components
│       ├── custom_text.dart      # Custom text widget
│       └── search_field.dart     # Search input widget
│
├── 📁 l10n/                  # Internationalization
│   ├── app_en.arb           # English translations
│   ├── app_ar.arb           # Arabic translations
│   ├── app_localizations.dart    # Generated localizations
│   ├── app_localizations_en.dart # English generated
│   └── app_localizations_ar.dart # Arabic generated
│
├── common_imports.dart      # Centralized imports
└── main.dart               # Application entry point
```

### Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                      │
├─────────────────────────────────────────────────────────────┤
│  Features/ (UI + ViewModels)                              │
│  ├── home/ (HomeScreen + HomeViewModel)                   │
│  ├── add_note/ (AddNoteScreen + AddNoteViewModel)         │
│  └── note_details/ (NoteDetailsScreen)                    │
└─────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────┐
│                      DOMAIN LAYER                          │
├─────────────────────────────────────────────────────────────┤
│  Core/ (Business Logic)                                   │
│  ├── language_provider.dart                               │
│  └── storage/ (Data Access)                               │
└─────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────┐
│                       DATA LAYER                           │
├─────────────────────────────────────────────────────────────┤
│  Data/ (Models + Repositories)                            │
│  ├── models/note/ (Note Entity)                           │
│  └── repositories/ (Data Access Layer)                    │
└─────────────────────────────────────────────────────────────┘
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
