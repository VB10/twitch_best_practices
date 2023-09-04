import 'package:isar/isar.dart';
import 'package:twitch_best_practices/isar_db/product/database/isar/core/isar_model.dart';

part 'user_model.g.dart';

@collection
class User with IsarModel {
  User({
    required this.name,
    required this.team,
  });

  @override
  Id get id => DatabaseId.user;

  final String name;
  final String team;
}

class DatabaseId {
  DatabaseId._();
  // login user sadece 1 tane olacağı için sabit olarak 1 e yazıyoruz.
  static const int user = 1;
}
