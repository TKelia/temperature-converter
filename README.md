# Temperature Converter App

A beautiful and user-friendly temperature conversion application built with Flutter that allows users to convert between Fahrenheit and Celsius temperatures.

## Features

- Convert between Fahrenheit and Celsius
- Real-time conversion updates
- Conversion history tracking
- Clean and intuitive user interface
- Responsive design (supports both portrait and landscape)
- Material Design implementation

## Technical Specifications

- Built with Flutter
- State management using setState
- Implements various Flutter widgets
- Follows Material Design guidelines
- Maintains conversion history
- Formats results to 2 decimal places

## Project Structure

```
lib/
├── main.dart              # App entry point
├── screens/
│   └── home_screen.dart   # Main conversion screen
├── widgets/
│   ├── conversion_form.dart    # Temperature input and conversion
│   └── history_list.dart       # Conversion history display
└── models/
    └── conversion_history.dart # History data model
```

## Installation

1. Clone this repository
2. Ensure Flutter is installed on your system
3. Run `flutter pub get` to install dependencies
4. Connect a device or start an emulator
5. Run `flutter run` to start the app

## Usage

1. Select the desired conversion type (Fahrenheit to Celsius or vice versa)
2. Enter the temperature value
3. Press the Convert button
4. View the converted result
5. Check the history section for previous conversions

## Implementation Details

- Conversion Formulas:
  - °F = °C × (9/5) + 32
  - °C = (°F - 32) × (5/9)
- Results are formatted to 2 decimal places
- Maintains conversion history during app session
- Implements responsive design for both orientations

## Code Style

This project follows Flutter's official style guide and best practices:
- Clear and meaningful variable/function names
- Comprehensive documentation and comments
- Modular and clean code structure
- Proper state management implementation
