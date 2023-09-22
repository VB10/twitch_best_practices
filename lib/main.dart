import 'package:flutter/material.dart';
import 'package:twitch_best_practices/feature/custom_dialog/ali_keles_View.dart';
import 'package:twitch_best_practices/feature/status/status_view.dart';
import 'package:twitch_best_practices/feature/text_field_bottom_sheet/text_field_bottom_sheet_view.dart';
import 'package:twitch_best_practices/speed_code/authentic/authentic_on_board.dart';
import 'package:twitch_best_practices/speed_code/chat_william/chat_william_view.dart';
import 'package:twitch_best_practices/speed_code/lang_app/lang_app_view.dart';
import 'package:twitch_best_practices/speed_code/rent/rent_view.dart';
import 'package:twitch_best_practices/speed_code/reset_password/reset_password_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: LangAppView(),
    );
  }
}
