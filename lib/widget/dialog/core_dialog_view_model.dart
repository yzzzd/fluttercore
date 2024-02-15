import 'package:flutter_core/widget/dialog/core_dialog.dart';
import 'package:get/get.dart';

class CoreDialogViewModel extends GetxController {
  var coreDialogLoading = false.obs;
  var coreDialodMessage = ''.obs;

  showDialog(String message, bool loading) {
    coreDialogLoading.value = loading;
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