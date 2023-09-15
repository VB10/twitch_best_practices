import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomRadiosDialog extends StatefulWidget {
  const CustomRadiosDialog({super.key});

  @override
  State<CustomRadiosDialog> createState() => _CustomRadiosDialogState();
}

class _CustomRadiosDialogState extends State<CustomRadiosDialog> {
  final List<MapEntry<String, int>> items = [
    const MapEntry('Item 1', 5),
    const MapEntry('Item 2', 4),
    const MapEntry('Item 3', 2),
    const MapEntry('Item 4', 3),
  ];
  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return _DialogForIOS(items);
    }
    return _DialogForGeneral('Sample', items);
  }
}

class _DialogForGeneral extends StatefulWidget {
  const _DialogForGeneral(this.title, this.items);

  final String title;
  final List<MapEntry<String, int>> items;

  @override
  State<_DialogForGeneral> createState() => _DialogForGeneralState();
}

class _DialogForGeneralState extends State<_DialogForGeneral> {
  int? _groupValue;

  void _updateValue(int value) {
    setState(() {
      _groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            if (_groupValue == null) return;
            Navigator.pop(context, _groupValue);
          },
          child: const Text('OK'),
        ),
      ],
      title: Text(widget.title),
      content: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.5,
        width: MediaQuery.sizeOf(context).width * 0.5,
        child: Visibility(
          visible: kIsWeb,
          replacement:
              _RadioColumListView(widget.items, _updateValue, _groupValue),
          child: _RadioColumListView(widget.items, _updateValue, _groupValue),
        ),
      ),
    );
  }
}

class _DialogForIOS extends StatefulWidget {
  const _DialogForIOS(this.items);

  final List<MapEntry<String, int>> items;

  @override
  State<_DialogForIOS> createState() => _DialogForIOSState();
}

class _DialogForIOSState extends State<_DialogForIOS> {
  int? _cupertinoSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.6),
        Container(
          color: Theme.of(context).colorScheme.background,
          width: double.maxFinite,
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              if (_cupertinoSelected == null) return;
              Navigator.pop(context, _cupertinoSelected);
            },
            child: const Text('OK'),
          ),
        ),
        Expanded(
          child: CupertinoPicker.builder(
            itemExtent: MediaQuery.sizeOf(context).height * 0.05,
            onSelectedItemChanged: (value) {
              _cupertinoSelected = value;
            },
            childCount: widget.items.length,
            itemBuilder: (context, index) => Center(
              child: Text(widget.items[index].key),
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
        ),
      ],
    );
  }
}

class _RadioColumListView extends StatelessWidget {
  const _RadioColumListView(this.items, this.onChanged, this.groupValue);
  final List<MapEntry<String, int>> items;
  final ValueChanged<int> onChanged;
  final int? groupValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  onChanged.call(items[index].value);
                },
                title: Text(items[index].key),
                leading: Radio<int>(
                  value: items[index].value,
                  groupValue: groupValue,
                  onChanged: (value) {
                    if (value == null) return;
                    onChanged.call(value);
                  },
                ),
              );
            },
          ),
        ),
        const Divider(),
      ],
    );
  }
}
