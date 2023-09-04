import 'package:flutter/material.dart';
import 'package:twitch_best_practices/isar_db/features/user_view.dart';
import 'package:twitch_best_practices/isar_db/product/database/isar/core/isar_database_initializer.dart';

Future<void> main() async {
  await _AppInitialize.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: UserView(),
    );
  }
}

class _AppInitialize {
  _AppInitialize._();
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await IsarDatabaseInitializer.instance.init();
  }
}
