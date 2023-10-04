import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitch_best_practices/core/base/view/base_stateless.dart';
import 'package:twitch_best_practices/core/base/viewModel/i_base_viewmodel.dart';

mixin ViewState<R extends StatefulWidget, T extends IBaseViewModel>
    on BaseState<R, T> {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  void changeLoading({required bool value}) {
    _isLoading.value = value;
  }

  Future<void> showDialogCustom() async {
    changeLoading(value: true);
    await showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    changeLoading(value: false);
  }

  @override
  Widget customBuild(BuildContext context);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          customBuild(context),
          ValueListenableBuilder<bool>(
            valueListenable: _isLoading,
            builder: (context, value, child) {
              if (value) {
                return ColoredBox(
                  color: Colors.grey.withOpacity(0.2),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget loadingWithBase() {
    return Material(
      child: Stack(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: _isLoading,
            builder: (context, value, child) {
              if (value) {
                return const CircularProgressIndicator();
              }
              return const SizedBox.shrink();
            },
          ),
          super.build(context),
        ],
      ),
    );
  }
}
