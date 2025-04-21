import 'package:flutter/material.dart';

class TrailingStopSettingsDialog extends StatefulWidget {
  final double initialActivationPrice;
  final double initialCallbackRate;
  final void Function(double activationPrice, double callbackRate) onSave;

  const TrailingStopSettingsDialog({
    super.key,
    required this.initialActivationPrice,
    required this.initialCallbackRate,
    required this.onSave,
  });

  @override
  _TrailingStopSettingsDialogState createState() =>
      _TrailingStopSettingsDialogState();
}

class _TrailingStopSettingsDialogState
    extends State<TrailingStopSettingsDialog> {
  late TextEditingController activationPriceController;
  late TextEditingController callbackRateController;

  @override
  void initState() {
    super.initState();
    activationPriceController = TextEditingController(
        text: widget.initialActivationPrice.toStringAsFixed(2));
    callbackRateController = TextEditingController(
        text: widget.initialCallbackRate.toStringAsFixed(2));
  }

  @override
  void dispose() {
    activationPriceController.dispose();
    callbackRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Trailing Stop Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: activationPriceController,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Activation Price (USDT)',
            ),
          ),
          TextField(
            controller: callbackRateController,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Callback Rate (%)',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final activationPrice =
                double.tryParse(activationPriceController.text) ?? 0.0;
            final callbackRate =
                double.tryParse(callbackRateController.text) ?? 0.0;
            widget.onSave(activationPrice, callbackRate);
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
