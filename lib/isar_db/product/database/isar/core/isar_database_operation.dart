import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:twitch_best_practices/isar_db/product/database/isar/core/isar_model.dart';

/// IsarModel den türemiş ve @collection notation ile işaretlenmiş modelin
/// direkt collection ı üzerinden işlem yapıyoruz
@immutable
abstract class IsarDatabaseOperation<T extends IsarModel> {
  const IsarDatabaseOperation(this.isar);
  final Isar isar;
  IsarCollection<T> get collection => isar.collection<T>();

  Future<T?> get({required int id}) async {
    return collection.get(id);
  }

  Future<int> put({required T object}) async {
    return isar.writeTxn(() => collection.put(object));
  }

  Future<bool> delete({required int id}) async {
    return isar.writeTxn(() => collection.delete(id));
  }

  Future<void> clear() async {
    return isar.writeTxn(collection.clear);
  }
}
