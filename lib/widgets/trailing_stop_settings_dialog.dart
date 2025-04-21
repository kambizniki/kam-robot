import 'package:flutter/material.dart';
import 'package:kambiz_robot/models/trailing_stop_model.dart';
import 'package:kambiz_robot/widgets/trailing_stop_settings_dialog.dart';

class TrailingStopWidget extends StatelessWidget {
  final TrailingStopModel trailingStopModel;
  final Function(TrailingStopModel) onUpdate;

  TrailingStopWidget({
    required this.trailingStopModel,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final updatedModel = await showDialog<TrailingStopModel>(
          context: context,
          builder: (context) => TrailingStopSettingsDialog(
            trailingStopModel: trailingStopModel,
          ),
        );
        if (updatedModel != null) {
          onUpdate(updatedModel);
        }
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text('Trailing Stop'),
            Spacer(),
            Text('${trailingStopModel.stopLossPercentage}%'),
          ],
        ),
      ),
    );
  }
}
