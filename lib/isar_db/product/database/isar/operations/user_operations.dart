import 'package:flutter/material.dart';
import 'package:twitch_best_practices/isar_db/features/user_model.dart';
import 'package:twitch_best_practices/isar_db/product/database/isar/core/isar_database_operation.dart';

@immutable
final class UserDatabaseOperations extends IsarDatabaseOperation<User> {
  const UserDatabaseOperations(super.isar);
}
