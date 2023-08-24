import 'package:flutter/material.dart';
import 'package:twitch_best_practices/feature/status/status_model.dart';
import 'package:twitch_best_practices/feature/status/status_view.dart';

mixin StatusViewMixin<T> on State<StatusView> {
  final ValueNotifier<StatusModel?> _statusModelNotifier = ValueNotifier(null);
  ValueNotifier<StatusModel?> get statusModelNotifier => _statusModelNotifier;
  @override
  void initState() {
    super.initState();
    _fetchSingleData();
  }

  Future<void> _fetchSingleData() async {
    await Future.delayed(const Duration(seconds: 2));
    _statusModelNotifier.value = StatusModel.sample2;
  }
}
