# DailyWellness

This repository contains a sample Flutter application called **DailyWellness**. The project demonstrates a simple wellness tracker with login, dashboard, and activity management screens. The app fetches motivational quotes from the public API at <https://favqs.com/api/qotd>.

## Getting Started

1. Ensure you have Flutter SDK 3.x installed.
2. Run `flutter pub get` to install dependencies.
3. Use `flutter run` to launch the application on an emulator or device.
4. To build a release APK, run `flutter build apk --release` and follow the signing instructions from the Flutter documentation.

## Testing

Execute unit and widget tests with:

```bash
flutter test
```

## Screenshots

Screenshots should be added in the `assets/` directory showing the app in portrait and landscape modes.

## Known Issues

- API failures are displayed as a simple error message on the dashboard.
- The project was generated manually for demonstration and may require adjustments before production use.
