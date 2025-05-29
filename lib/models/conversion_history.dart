// Class to store one temperature conversion
class ConversionHistory {
  // What type of conversion (F to C or C to F)
  final String operation;
  // The temperature that was input
  final double inputValue;
  // The converted temperature
  final double result;

  // Constructor - needs all three values
  ConversionHistory({
    required this.operation,
    required this.inputValue,
    required this.result,
  });

  // Makes a nice string like "F to C: 32.0 => 0.0"
  String get formattedString {
    return '$operation: ${inputValue.toStringAsFixed(1)} => ${result.toStringAsFixed(1)}';
  }
}
