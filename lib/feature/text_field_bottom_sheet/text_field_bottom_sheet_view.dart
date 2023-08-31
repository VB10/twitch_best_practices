import 'package:flutter/material.dart';
import 'package:twitch_best_practices/feature/text_field_bottom_sheet/text_bottom_mixin.dart';

class TextBottomSheetView extends StatefulWidget {
  const TextBottomSheetView({Key? key}) : super(key: key);
  @override
  State<TextBottomSheetView> createState() => _TextBottomSheetViewState();
}

class _TextBottomSheetViewState extends State<TextBottomSheetView>
    with TextBottomMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<String>(
          valueListenable: titleNotifier,
          builder: (BuildContext context, String value, Widget? child) {
            return Text(value);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showTextFieldSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}
