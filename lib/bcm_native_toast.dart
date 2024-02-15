import 'package:bcm_core_utils/bcm_core_utils.dart';
import 'package:bcm_native_toast/pigeon.dart';

import 'bcm_native_toast_platform_interface.dart';

class BcmNativeToast extends BcmToast {
  Future<String?> getPlatformVersion() {
    return BcmNativeToastPlatform.instance.getPlatformVersion();
  }

  @override
  void show(String message) {
    BcmHostApi().showToast(Message(text: message));
  }
}
