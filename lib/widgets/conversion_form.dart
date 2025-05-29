import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConversionForm extends StatelessWidget {
  final bool isFahrenheitToCelsius;
  final TextEditingController controller;
  final Function(double) onConvert;
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
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
            ElevatedButton(
              onPressed: () {
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
