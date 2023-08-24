import 'package:twitch_best_practices/feature/status/status_model.dart';
import 'package:twitch_best_practices/feature/status/validator/online_validator.dart';
import 'package:twitch_best_practices/feature/status/validator/validator_status.dart';

final class StatusOperation {
  final StatusModel model;

  StatusOperation({required this.model});

  List<StatusType> makeStatusTypeItems() {
    final List<StatusType?> items = [];
    final List<ValidatorStatus> validators = [
      OnlineValidator(model: model),
      ActiveValidator(model: model),
    ];

    final newItems = validators.map((e) => e.make()).toList();
    items.add(isOnlineType);
    items.add(isDeliveryType);
    items.add(isActiveType);
    items.add(isReturnType);

    return items
        .where((element) => element != null)
        .cast<StatusType>()
        .toList();
  }

  StatusType? get isOnlineType =>
      model.isOnline == true ? StatusType.online : null;

  StatusType? get isDeliveryType =>
      model.isDelivery == true ? StatusType.delivery : null;

  StatusType? get isActiveType =>
      model.isActive == true ? StatusType.active : null;

  StatusType? get isReturnType =>
      model.isReturn == true ? StatusType.canReturn : null;
}
