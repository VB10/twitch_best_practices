import 'package:flutter/material.dart';

/// It will create rounded text field
///
@immutable
final class TextFieldRounded extends StatefulWidget {
  const TextFieldRounded({
    required this.onChanged,
    this.controller,
    super.key,
    this.labelText,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.contentFieldEdge = TextFieldPaddings.small,
    this.boxDecoration,
  });

  final String? labelText;
  final String? hintText;
  final TextInputType keyboardType;

  final TextEditingController? controller;
  final ValueChanged<String> onChanged;
  final TextFieldPaddings contentFieldEdge;
  final BoxDecoration? boxDecoration;

  @override
  State<TextFieldRounded> createState() => _TextFieldRoundedState();
}

class _TextFieldRoundedState extends State<TextFieldRounded> {
  late final TextEditingController? _controller;
  late final String _labelText;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _labelText = widget.labelText ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_labelText.isEmpty) {
      return _textField();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_labelText, style: Theme.of(context).textTheme.titleLarge),
        _textField(),
      ],
    );
  }

  DecoratedBox _textField() {
    return DecoratedBox(
      decoration: widget.boxDecoration ?? const _Decoration(),
      child: TextFormField(
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        controller: _controller,
        cursorColor: Colors.black,
        decoration: _decoration(),
      ),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      contentPadding: widget.contentFieldEdge.padding,
      hintText: widget.hintText,
    );
  }
}

final class _Decoration extends BoxDecoration {
  const _Decoration()
      : super(
          color: Colors.grey,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        );
}

enum TextFieldPaddings {
  small(EdgeInsets.all(8)),
  medium(EdgeInsets.all(16)),
  large(EdgeInsets.all(24));

  final EdgeInsets padding;
  const TextFieldPaddings(this.padding);
}
