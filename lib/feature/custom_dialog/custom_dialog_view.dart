import 'package:flutter/material.dart';
import 'package:twitch_best_practices/feature/custom_dialog/custom_radios_dialog.dart';
import 'package:twitch_best_practices/feature/custom_dialog/text_field_dialog.dart';

@immutable
final class CustomDialog {
  const CustomDialog._();

  static Future<void> showMyDialog({
    required BuildContext context,
    required String title,
    required String text,
    required Widget content,
    required List<Widget>? actions,
    bool barrierDismissible = true,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: actions,
        );
      },
    );
  }

  static Future<String?> showDialogTextField({
    required BuildContext context,
    required String title,
  }) async {
    final response = await showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return TextFieldDialog(title: title);
      },
    );

    return response ?? '';
  }

  static Future<int?> showDialogRadios({
    required BuildContext context,
  }) async {
    final response = await showDialog<int?>(
      context: context,
      builder: (BuildContext context) {
        return const CustomRadiosDialog();
      },
    );

    return response;
  }
}
