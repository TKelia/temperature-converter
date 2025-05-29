import 'package:flutter/material.dart';
import '../models/conversion_history.dart';
import '../widgets/conversion_form.dart';
import '../widgets/history_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isFahrenheitToCelsius = true;
  final _temperatureController = TextEditingController();
  final List<ConversionHistory> _history = [];
  double? _convertedTemperature;

  void _convert(double value) {
    setState(() {
      if (_isFahrenheitToCelsius) {
        _convertedTemperature = (value - 32) * 5 / 9;
        _history.insert(
          0,
          ConversionHistory(
            operation: 'F to C',
            inputValue: value,
            result: _convertedTemperature!,
          ),
        );
      } else {
        _convertedTemperature = value * 9 / 5 + 32;
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
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Column(
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
                Expanded(
                  child: HistoryList(history: _history),
                ),
              ],
            );
          } else {
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
