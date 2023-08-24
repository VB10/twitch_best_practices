import 'package:twitch_best_practices/feature/status/status_model.dart';
import 'package:twitch_best_practices/feature/status/validator/validator_status.dart';

final class OnlineValidator extends ValidatorStatus {
  OnlineValidator({required super.model});

  @override
  StatusType? make() {
    if (model.isOnline == true) {
      return StatusType.online;
    }

    return null;
  }
}

final class ActiveValidator extends ValidatorStatus {
  ActiveValidator({required super.model});

  @override
  StatusType? make() {
    if (model.isActive == true) {
      return StatusType.active;
    }

    return null;
  }
}
