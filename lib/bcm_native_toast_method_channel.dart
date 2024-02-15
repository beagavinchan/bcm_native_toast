import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bcm_native_toast_platform_interface.dart';

/// An implementation of [BcmNativeToastPlatform] that uses method channels.
class MethodChannelBcmNativeToast extends BcmNativeToastPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bcm_native_toast');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
