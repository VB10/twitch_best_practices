import 'package:flutter/material.dart';

final class ProjectGeneral {
  ProjectGeneral._();

  static const loginTitle = 'Giriş';
}

enum ProjectLoginPadding {
  /// value is 8
  low(8),

  /// value is 16
  normal(16),

  /// value is 20
  high(20);

  final double value;
  const ProjectLoginPadding(this.value);

  EdgeInsets get symmetricVertical => EdgeInsets.symmetric(vertical: value);
  EdgeInsets get symmetricHorizontal => EdgeInsets.symmetric(horizontal: value);
  EdgeInsets get symmetric =>
      EdgeInsets.symmetric(horizontal: value, vertical: value);
  EdgeInsets get onlyTop => EdgeInsets.only(top: value);
  EdgeInsets get onlyBottom => EdgeInsets.only(bottom: value);
  EdgeInsets get onlyLeft => EdgeInsets.only(left: value);
  EdgeInsets get onlyRight => EdgeInsets.only(right: value);
  EdgeInsets get all => EdgeInsets.all(value);
}
