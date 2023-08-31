import 'package:flutter/material.dart';

final class TextBottomModel {
  TextBottomModel({required this.value, required this.isCheck});
  final String value;
  final bool isCheck;
}

class TextBottomSheet extends StatefulWidget {
  const TextBottomSheet({super.key});

  static Future<TextBottomModel?> show(BuildContext context) {
    return showModalBottomSheet<TextBottomModel>(
      context: context,
      builder: (context) {
        return const TextBottomSheet();
      },
    );
  }

  @override
  State<TextBottomSheet> createState() => _TextBottomSheetState();
}

class _TextBottomSheetState extends State<TextBottomSheet> with _TextMixin {
  static const String _buttonTitle = 'Save';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: _updateText,
        ),
        Checkbox(
          value: _isCheck,
          onChanged: _updateCheckBox,
        ),
        IgnorePointer(
          ignoring: !_isValid,
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _isValid ? 1 : 0.2,
            child: ElevatedButton(
              onPressed: _onButtonPressed,
              child: const Text(_buttonTitle),
            ),
          ),
        ),
      ],
    );
  }
}

mixin _TextMixin on State<TextBottomSheet> {
  bool _isCheck = false;
  String _textValue = '';
  bool get _isValid => _isCheck && _textValue.isNotEmpty;
  void _updateCheckBox(bool? value) {
    if (value == null) return;
    setState(() {
      _isCheck = value;
    });
  }

  void _updateText(String value) {
    setState(() {
      _textValue = value;
    });
  }

  void _onButtonPressed() {
    if (!_isValid) return;
    Navigator.pop(
      context,
      TextBottomModel(value: _textValue, isCheck: _isCheck),
    );
  }
}
