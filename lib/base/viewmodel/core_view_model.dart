import 'package:flutter_core/widget/dialog/core_dialog_view_model.dart';
import 'package:get/get.dart';

class CoreViewModel extends GetxController {
  final CoreDialogViewModel _dialogViewModel = Get.put(CoreDialogViewModel());

  showLoadingDialog(String message) async {
    _dialogViewModel.showLoading(message);
  }

  showMessageDialog(String message) async {
    _dialogViewModel.showMessage(message);
  }
}