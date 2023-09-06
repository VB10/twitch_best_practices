import 'package:flutter/material.dart';

class ApiClass {
  Future<void> getData(BuildContext context) async {
    final result = await Future<bool>.delayed(
      const Duration(seconds: 3),
      () {
        return true;
      },
    );
    if (result) {
      // How we refactor  this code to avoid BuildContext's across async gaps
      showCustomDialog(context);
    }
  }

  void showCustomDialog(BuildContext context) {
    showAdaptiveDialog<bool>(
      context: context,
      builder: (context) => const Text('Your result is successful'),
    );
  }
}
