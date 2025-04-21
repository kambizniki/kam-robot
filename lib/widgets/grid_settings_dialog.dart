import 'package:flutter/material.dart';

class GridSettingsDialog extends StatefulWidget {
  final double initialMinPrice;
  final double initialMaxPrice;
  final int initialGridCount;

  final void Function(double minPrice, double maxPrice, int gridCount) onConfirm;

  const GridSettingsDialog({
    super.key,
    required this.initialMinPrice,
    required this.initialMaxPrice,
    required this.initialGridCount,
    required this.onConfirm,
  });

  @override
  State<GridSettingsDialog> createState() => _GridSettingsDialogState();
}

class _GridSettingsDialogState extends State<GridSettingsDialog> {
  late double minPrice;
  late double maxPrice;
  late int gridCount;

  @override
  void initState() {
    super.initState();
    minPrice = widget.initialMinPrice;
    maxPrice = widget.initialMaxPrice;
    gridCount = widget.initialGridCount;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Grid Settings'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Min Price'),
              controller: TextEditingController(text: minPrice.toString()),
              onChanged: (value) => minPrice = double.tryParse(value) ?? minPrice,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Max Price'),
              controller: TextEditingController(text: maxPrice.toString()),
              onChanged: (value) => maxPrice = double.tryParse(value) ?? maxPrice,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Grid Count'),
              controller: TextEditingController(text: gridCount.toString()),
              onChanged: (value) => gridCount = int.tryParse(value) ?? gridCount,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: const Text('Confirm'),
          onPressed: () {
            widget.onConfirm(minPrice, maxPrice, gridCount);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
