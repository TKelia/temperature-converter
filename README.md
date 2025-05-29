# Temperature Converter

This is my temperature converter app for the Flutter assignment. It lets you convert temperatures between Fahrenheit and Celsius.

## What it does

- Converts F to C and C to F
- Shows your conversion history
- Works in portrait and landscape mode
- Looks nice with Material Design

## How to use it

1. Pick whether you want F to C or C to F
2. Type in the temperature
3. Hit Convert
4. See your result and it's saved in history

## Cool features I added

- Shows results with 2 decimal places (like 32.00°F)
- Keeps track of what you converted
- Works both ways (F to C and C to F)
- Nice clean look
- Works in portrait and landscape

## The formulas I used

- For F to C: (°F - 32) × 5/9
- For C to F: °C × 9/5 + 32

## How to run it

1. Make sure you have Flutter
2. Get the code from GitHub
3. Run `flutter pub get`
4. Use `flutter run` to start

## Files and stuff

I organized the code into different folders:
- `lib/main.dart` - where everything starts
- `lib/screens` - the main screen
- `lib/widgets` - the different parts of the app
- `lib/models` - for keeping track of conversions

Tried to keep the code clean and easy to understand with comments explaining the tricky parts!
