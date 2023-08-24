import 'package:flutter/material.dart';

@immutable
final class StatusModel {
  final bool? isOnline;
  final bool? isDelivery;
  final bool? isActive;
  final bool? isReturn;
  final String? name;

  const StatusModel(
      {this.isOnline,
      this.isDelivery,
      this.isActive,
      this.isReturn,
      this.name});

  static const StatusModel sample1 =
      StatusModel(isActive: true, isOnline: true, name: 'vb');
  static const StatusModel sample2 =
      StatusModel(isReturn: true, isOnline: true, isDelivery: true);
}

enum StatusType {
  online,
  delivery,
  active,
  canReturn,
}
