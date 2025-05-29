import 'package:flutter/material.dart';
import '../models/conversion_history.dart';

// Widget to show the list of previous conversions
class HistoryList extends StatelessWidget {
  // List of past conversions
  final List<ConversionHistory> history;

  const HistoryList({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for the history section
          const Text(
            'Conversion History',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Scrollable list of conversions
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                // Each history item in a card
                return Card(
                  child: ListTile(
                    title: Text(
                      history[index].formattedString,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
