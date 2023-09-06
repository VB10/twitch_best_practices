import 'package:flutter/material.dart';
import 'package:twitch_best_practices/speed_code/login/view/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: LoginView(),
    );
  }
}
