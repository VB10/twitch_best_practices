import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:twitch_best_practices/isar_db/features/user_model.dart';
import 'package:twitch_best_practices/isar_db/features/user_view.dart';
import 'package:twitch_best_practices/isar_db/product/database/isar/core/isar_database_operation.dart';
import 'package:twitch_best_practices/isar_db/product/database/isar/operations/user_operations.dart';

mixin UserViewModel on State<UserView> {
  IsarDatabaseOperation<User>? db;
  ValueNotifier<User?> item = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    // main içerisinde isar.open() çağırdığım için force ettim.
    // force ettiysem kesin yanlış yapmışımdır.
    // doğru şekilde nasıl yapılabilir
    db = UserDatabaseOperations(Isar.getInstance()!);
    userControl();
  }

  Future<void> userControl() async {
    item.value = await db?.get(id: DatabaseId.user);
  }

  Future<void> login(User? model) async {
    if (model == null) return;
    await db?.put(object: model);
    await userControl();
  }

  Future<void> logout() async {
    await db?.clear();
    await userControl();
  }
}
