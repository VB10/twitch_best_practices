import 'package:flutter/material.dart';
import 'package:twitch_best_practices/feature/custom_dialog/text_field_rounded.dart';

class TextFieldDialog extends StatefulWidget {
  const TextFieldDialog({required this.title, super.key});
  final String title;

  @override
  State<TextFieldDialog> createState() => _TextFieldDialogState();
}

class _TextFieldDialogState extends State<TextFieldDialog> {
  String _value = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context, _value);
          },
          icon: const Icon(Icons.save),
        ),
      ],
      content: TextFieldRounded(
        hintText: 'Text here...',
        keyboardType: TextInputType.number,
        onChanged: (text) {
          _value = text;
        },
        controller: TextEditingController(),
      ),
    );
  }
}
