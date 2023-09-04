part of 'isar_database_initializer.dart';

@immutable
final class _IsarCollections {
  const _IsarCollections._();

  /// Isar için @collection notation verdiğimiz modelleri burada listeliyoruz
  /// Isar.open a verip tüm schema ları açmış oluyoruz.
  static List<CollectionSchema<dynamic>> schemas = [
    UserSchema,
  ];
}
