import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bcm_native_toast_method_channel.dart';

abstract class BcmNativeToastPlatform extends PlatformInterface {
  /// Constructs a BcmNativeToastPlatform.
  BcmNativeToastPlatform() : super(token: _token);

  static final Object _token = Object();

  static BcmNativeToastPlatform _instance = MethodChannelBcmNativeToast();

  /// The default instance of [BcmNativeToastPlatform] to use.
  ///
  /// Defaults to [MethodChannelBcmNativeToast].
  static BcmNativeToastPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BcmNativeToastPlatform] when
  /// they register themselves.
  static set instance(BcmNativeToastPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
