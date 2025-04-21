import 'package:flutter/material.dart';
import 'package:kambiz_robot/models/trailing_stop_model.dart';

class TrailingStopSettingsDialog extends StatefulWidget {
  final TrailingStopModel trailingStopModel;

  TrailingStopSettingsDialog({required this.trailingStopModel});

  @override
  _TrailingStopSettingsDialogState createState() =>
      _TrailingStopSettingsDialogState();
}

class _TrailingStopSettingsDialogState
    extends State<TrailingStopSettingsDialog> {
  late double _stopLossPercentage;

  @override
  void initState() {
    super.initState();
    _stopLossPercentage = widget.trailingStopModel.stopLossPercentage;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Trailing Stop Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Stop Loss Percentage: ${_stopLossPercentage.toStringAsFixed(1)}%'),
          Slider(
            value: _stopLossPercentage,
            min: 0.1,
            max: 20.0,
            divisions: 200,
            label: _stopLossPercentage.toStringAsFixed(1),
            onChanged: (value) {
              setState(() {
                _stopLossPercentage = value;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final updatedModel = TrailingStopModel(
              stopLossPercentage: _stopLossPercentage,
            );
            Navigator.of(context).pop(updatedModel);
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
