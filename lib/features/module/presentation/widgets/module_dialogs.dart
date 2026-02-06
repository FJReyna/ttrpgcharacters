import 'package:flutter/material.dart';

void showTrackerModuleEditorDialog(
  BuildContext context, {
  required String title,
}) async {
  final bool? result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('$title - Tracker Module'),
      content: const Text('This is where you would edit the tracker module.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Save'),
        ),
      ],
    ),
  );
}
