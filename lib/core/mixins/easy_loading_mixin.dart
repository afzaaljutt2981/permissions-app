import 'package:flutter_easyloading/flutter_easyloading.dart';

mixin EasyLoadingMixin {
  final easyLoadingI = EasyLoading.instance;

  void showLoading() {
    EasyLoading.dismiss();
    EasyLoading.show();
  }

  void dismissLoading() {
    EasyLoading.dismiss();
  }

  void showMessage(String message) {
    EasyLoading.dismiss();
    EasyLoading.showToast(message);
  }

  Future<void> performLoadingTask({required Future Function() task}) async {
    try {
      showLoading();
      await task.call();
      dismissLoading();
    } catch (error) {
      dismissLoading();
      rethrow;
    }
  }
}
