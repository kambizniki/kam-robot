import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a provider for trailing stop toggle state
final trailingStopProvider = StateProvider<bool>((ref) => false);

class TrailingStopSwitch extends ConsumerWidget {
  const TrailingStopSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // Watch the trailing stop state
    final trailingStopEnabled = watch(trailingStopProvider).state;

    return SwitchListTile(
      title: const Text('Enable Trailing Stop'),
      value: trailingStopEnabled,
      onChanged: (bool value) {
        context.read(trailingStopProvider).state = value;
      },
    );
  }
}
