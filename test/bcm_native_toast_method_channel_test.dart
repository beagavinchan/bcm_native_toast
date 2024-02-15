import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bcm_native_toast/bcm_native_toast_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBcmNativeToast platform = MethodChannelBcmNativeToast();
  const MethodChannel channel = MethodChannel('bcm_native_toast');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
