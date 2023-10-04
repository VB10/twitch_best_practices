import 'package:flutter/material.dart';
import 'package:twitch_best_practices/core/base/viewModel/i_base_viewmodel.dart';

mixin BaseState<R extends StatefulWidget, T extends IBaseViewModel>
    on State<R> {
  @override
  Widget build(BuildContext context) => customBuild(context);

  /// set your view model
  T get viewModel;

  /// make your custom widget
  Widget customBuild(BuildContext context);

  /// call this method for your ui operation before drawing ui
  void onInitialize();

  @override
  void initState() {
    super.initState();
    onInitialize.call();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.init();
    });
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.reset();
  }
}
