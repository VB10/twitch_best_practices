/// farklı isar instance ihtiyaç duyulursa subPath ve instance name için :
enum IsarItems {
  root(instanceName: 'root', path: 'root'); // root için kullanılacağı için '/' ile başlamasına gerek yok

  const IsarItems({required this.path, required this.instanceName});
  final String path;
  final String instanceName;
}
