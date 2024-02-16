import 'package:flutter/material.dart';
import 'package:flutter_core/core.dart';
import 'package:flutter_core/widget/dialog/core_dialog_view_model.dart';

class CoreDialog extends StatelessWidget {
  const CoreDialog({super.key});

  @override
  Widget build(BuildContext context) {

    final CoreDialogViewModel viewModel = Get.find();
    
    return GestureDetector(
      onTap: () => viewModel.dismiss(),
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {},
          child: Dialog(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                children: [
                  Obx(() => Visibility(visible: viewModel.coreDialogLoading.value == true, child: const CircularProgressIndicator())),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Obx(() => Text('${viewModel.coreDialodMessage}'))
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}