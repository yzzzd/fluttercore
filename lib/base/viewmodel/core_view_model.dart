import 'package:flutter_core/widget/dialog/core_dialog_view_model.dart';
import 'package:get/get.dart';

class CoreViewModel extends GetxController {
  final CoreDialogViewModel _dialogViewModel = Get.put(CoreDialogViewModel());

  showDialog({required String message, bool loading = false}) async {
    _dialogViewModel.showDialog(message, loading);
  }

  dismissDialog() => _dialogViewModel.dismiss();
}