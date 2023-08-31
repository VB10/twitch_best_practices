import 'package:flutter/material.dart';
import 'package:twitch_best_practices/feature/text_field_bottom_sheet/text_bottom_sheet.dart';
import 'package:twitch_best_practices/feature/text_field_bottom_sheet/text_field_bottom_sheet_view.dart';

mixin TextBottomMixin on State<TextBottomSheetView> {
  final ValueNotifier<String> titleNotifier = ValueNotifier<String>("");

  Future<void> showTextFieldSheet() async {
    final response = await TextBottomSheet.show(context);
    if (response == null) return;
    titleNotifier.value = response.value;
  }
}
