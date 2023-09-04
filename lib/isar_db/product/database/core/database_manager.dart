abstract class IDatabaseManager {
  IDatabaseManager();
  Future<void> init();
  Future<void> clear();
}
