// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:twitch_best_practices/isar_db/features/user_model.dart';
import 'package:twitch_best_practices/isar_db/product/database/core/database_manager.dart';

part 'isar_collections.dart';

@immutable
final class IsarDatabaseInitializer extends IDatabaseManager {
  IsarDatabaseInitializer._init();
  static final IsarDatabaseInitializer _instace = IsarDatabaseInitializer._init();
  static IsarDatabaseInitializer get instance => _instace;

  @override
  Future<void> init() async {
    // path paketiyle sub path oluşturulur, pr karışık olmaması için direkt aldım.
    final dir = await getApplicationDocumentsDirectory();
    await Isar.open(_IsarCollections.schemas, directory: dir.path);
  }

  @override
  Future<void> clear() async {
    /// subPath verilip subPath silinecek.
    final dir = await getApplicationDocumentsDirectory();
    await dir.delete();
  }
}
