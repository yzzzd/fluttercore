import 'package:flutter_core/base/viewmodel/core_view_model.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CollectBuilder<T extends CoreViewModel> extends GetBuilder<T> {
  const CollectBuilder({required super.builder, super.key});
}