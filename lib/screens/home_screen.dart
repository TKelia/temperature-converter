import 'package:flutter/material.dart';
import '../models/conversion_history.dart';
import '../widgets/conversion_form.dart';
import '../widgets/history_list.dart';

// Main screen of the app
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Keep track of which conversion we're doing
  bool _isFahrenheitToCelsius = true;
  
  // For the temperature input
  final _temperatureController = TextEditingController();
  
  // List to store conversion history
  final List<ConversionHistory> _history = [];
  
  // Store the converted result
  double? _convertedTemperature;

  // Convert the temperature when button is pressed
  void _convert(double value) {
    setState(() {
      // If converting F to C
      if (_isFahrenheitToCelsius) {
        _convertedTemperature = (value - 32) * 5 / 9;
        // Add to history
        _history.insert(
          0, // Add at the start of the list
          ConversionHistory(
            operation: 'F to C',
            inputValue: value,
            result: _convertedTemperature!,
          ),
        );
      } else {
        // If converting C to F
        _convertedTemperature = value * 9 / 5 + 32;
        // Add to history
        _history.insert(
          0,
          ConversionHistory(
            operation: 'C to F',
            inputValue: value,
            result: _convertedTemperature!,
          ),
        );
      }
    });
  }

  // Clean up when done
  @override
  void dispose() {
    _temperatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
        centerTitle: true,
      ),
      // Check if phone is portrait or landscape
      body: OrientationBuilder(
        builder: (context, orientation) {
          // Portrait mode - stack everything vertically
          if (orientation == Orientation.portrait) {
            return Column(
              children: [
                // The form for input
                ConversionForm(
                  isFahrenheitToCelsius: _isFahrenheitToCelsius,
                  controller: _temperatureController,
                  onConvert: _convert,
                  onConversionTypeChanged: (value) {
                    setState(() {
                      _isFahrenheitToCelsius = value;
                    });
                  },
                ),
                // Show result if we have one
                if (_convertedTemperature != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Result: ${_convertedTemperature!.toStringAsFixed(2)}° ${_isFahrenheitToCelsius ? 'C' : 'F'}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                // History list takes up remaining space
                Expanded(
                  child: HistoryList(history: _history),
                ),
              ],
            );
          } else {
            // Landscape mode - put form and history side by side
            return Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ConversionForm(
                        isFahrenheitToCelsius: _isFahrenheitToCelsius,
                        controller: _temperatureController,
                        onConvert: _convert,
                        onConversionTypeChanged: (value) {
                          setState(() {
                            _isFahrenheitToCelsius = value;
                          });
                        },
                      ),
                      if (_convertedTemperature != null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Result: ${_convertedTemperature!.toStringAsFixed(2)}° ${_isFahrenheitToCelsius ? 'C' : 'F'}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // History list on the right side
                Expanded(
                  child: HistoryList(history: _history),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
