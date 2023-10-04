import 'package:flutter/material.dart';
import 'package:twitch_best_practices/feature/custom_dialog/custom_dialog_view.dart';
import 'package:twitch_best_practices/feature/custom_dialog/text_field_rounded.dart';

class AliKelesView extends StatefulWidget {
  const AliKelesView({super.key});
  @override
  State<AliKelesView> createState() => _AliKelesViewState();
}

class _AliKelesViewState extends State<AliKelesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await CustomDialog.showDialogRadios(
            context: context,
          );

          if (response != null) {
            print(response);
          }
        },
      ),
      body: TextFieldRounded(
        controller: TextEditingController(),
        onChanged: (value) {},
      ),
    );
  }
}
