import 'package:flutter/material.dart';
import 'package:flutter_core/base/viewmodel/core_view_model.dart';
import 'package:get/get.dart';

@immutable
abstract class CoreScreen<T extends CoreViewModel> extends GetView<T> {
  const CoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!viewModel.initialized) {
      initViewModel();
    }

    return buildScreen(context);
  }

  @protected
  Widget buildScreen(BuildContext context);

  @protected
  void initViewModel() {
    viewModel.initialized;
  }

  @protected
  T get viewModel => controller;
}