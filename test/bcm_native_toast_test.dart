import 'package:flutter_test/flutter_test.dart';
import 'package:bcm_native_toast/bcm_native_toast.dart';
import 'package:bcm_native_toast/bcm_native_toast_platform_interface.dart';
import 'package:bcm_native_toast/bcm_native_toast_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBcmNativeToastPlatform
    with MockPlatformInterfaceMixin
    implements BcmNativeToastPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BcmNativeToastPlatform initialPlatform = BcmNativeToastPlatform.instance;

  test('$MethodChannelBcmNativeToast is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBcmNativeToast>());
  });

  test('getPlatformVersion', () async {
    BcmNativeToast bcmNativeToastPlugin = BcmNativeToast();
    MockBcmNativeToastPlatform fakePlatform = MockBcmNativeToastPlatform();
    BcmNativeToastPlatform.instance = fakePlatform;

    expect(await bcmNativeToastPlugin.getPlatformVersion(), '42');
  });
}
