import 'package:twitch_best_practices/feature/status/status_model.dart';

abstract class ValidatorStatus {
  final StatusModel model;

  ValidatorStatus({required this.model});
  StatusType? make();
}
