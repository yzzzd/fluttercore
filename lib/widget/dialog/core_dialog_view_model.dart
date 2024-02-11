import 'package:flutter_core/widget/dialog/core_dialog.dart';
import 'package:get/get.dart';

class CoreDialogViewModel extends GetxController {
  var coreDialogLoading = false.obs;
  var coreDialodMessage = ''.obs;

  showLoading(String message) {
    coreDialogLoading.value = true;
    coreDialodMessage.value = message;
    _showDialog();
  }

  showMessage(String message) {
    coreDialogLoading.value = false;
    coreDialodMessage.value = message;
    _showDialog();
  }

  _showDialog() {
    if (Get.isDialogOpen == false) {
      Get.dialog(CoreDialog(), barrierDismissible: false);
    }
  }

  dismiss() {
    if (Get.isDialogOpen == true && coreDialogLoading == false) {
      Get.back();
    }
  }
}