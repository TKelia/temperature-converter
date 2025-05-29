import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Widget for the temperature input form
class ConversionForm extends StatelessWidget {
  // Which way we're converting
  final bool isFahrenheitToCelsius;
  // For the text input
  final TextEditingController controller;
  // Function to call when converting
  final Function(double) onConvert;
  // Function to call when changing conversion type
  final Function(bool) onConversionTypeChanged;

  const ConversionForm({
    Key? key,
    required this.isFahrenheitToCelsius,
    required this.controller,
    required this.onConvert,
    required this.onConversionTypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Add some shadow
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Radio buttons for F to C or C to F
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('°F to °C'),
                    value: true,
                    groupValue: isFahrenheitToCelsius,
                    onChanged: (value) => onConversionTypeChanged(value!),
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('°C to °F'),
                    value: false,
                    groupValue: isFahrenheitToCelsius,
                    onChanged: (value) => onConversionTypeChanged(value!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Text field for temperature input
            TextField(
              controller: controller,
              // Allow decimal numbers
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              // Only allow numbers and decimal point
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.-]')),
              ],
              decoration: InputDecoration(
                labelText: 'Enter temperature in ${isFahrenheitToCelsius ? '°F' : '°C'}',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            // Convert button
            ElevatedButton(
              onPressed: () {
                // Try to convert the input to a number
                final value = double.tryParse(controller.text);
                if (value != null) {
                  onConvert(value);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Convert',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
