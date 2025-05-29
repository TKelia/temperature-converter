class ConversionHistory {
  final String operation;
  final double inputValue;
  final double result;

  ConversionHistory({
    required this.operation,
    required this.inputValue,
    required this.result,
  });

  String get formattedString {
    return '$operation: ${inputValue.toStringAsFixed(1)} => ${result.toStringAsFixed(1)}';
  }
}
