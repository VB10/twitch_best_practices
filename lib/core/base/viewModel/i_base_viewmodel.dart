import 'package:flutter/cupertino.dart';

abstract class IBaseViewModel extends ChangeNotifier {
  Future<void> init();

  void reset();
}
