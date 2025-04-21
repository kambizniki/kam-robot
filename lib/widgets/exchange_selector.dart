import 'package:flutter/material.dart';

class ExchangeSelector extends StatelessWidget {
  final List<String> exchanges;
  final String selectedExchange;
  final ValueChanged<String> onChanged;

  const ExchangeSelector({
    super.key,
    required this.exchanges,
    required this.selectedExchange,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'صرافی',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      value: selectedExchange,
      items: exchanges
          .map((exchange) => DropdownMenuItem(
                value: exchange,
                child: Text(exchange),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
