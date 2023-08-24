import 'package:flutter/material.dart';
import 'package:twitch_best_practices/feature/status/status_model.dart';
import 'package:twitch_best_practices/feature/status/status_operation.dart';
import 'package:twitch_best_practices/feature/status/status_view_mixin.dart';

class StatusView extends StatefulWidget {
  const StatusView({Key? key}) : super(key: key);
  @override
  State<StatusView> createState() => _StatusViewState();
}

// 00:21
class _StatusViewState extends State<StatusView> with StatusViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ValueListenableBuilder<StatusModel?>(
          valueListenable: statusModelNotifier,
          builder: (BuildContext context, StatusModel? value, Widget? child) {
            if (value == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return _StatusColumn(statusModel: value);
          },
        ));
  }
}

class _StatusColumn extends StatelessWidget {
  _StatusColumn({
    required this.statusModel,
  }) {
    _items = StatusOperation(model: statusModel).makeStatusTypeItems();
  }

  late final List<StatusType> _items;
  final StatusModel statusModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        return _StatusCard(name: statusModel.name, type: _items[index]);
      },
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({required this.name, required this.type});

  final String? name;
  final StatusType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name ?? ''),
        Text(type.name),
      ],
    );
  }
}
