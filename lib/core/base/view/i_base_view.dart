import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:twitch_best_practices/core/base/viewModel/i_base_viewmodel.dart' show IBaseViewModel;

class IBaseView<T extends IBaseViewModel> extends StatelessWidget {
  const IBaseView({
    required this.viewModel,
    required this.builder,
    super.key,
    this.loadingWidget,
    this.onModelReady,
  });
  final Widget Function(T model) builder;
  final T viewModel;
  final Widget? loadingWidget;
  final dynamic Function(T? model)? onModelReady;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<T>.reactive(
      disposeViewModel: false,
      onDispose: (viewModel) => viewModel.reset(),
      viewModelBuilder: () => viewModel,
      builder: (_, T? model, __) => builder(model!),
      onViewModelReady: (T? viewModel) async {
        if (onModelReady == null) {
          await viewModel?.init();
        } else {
          await onModelReady!(viewModel);
        }
      },
    );
  }
}
