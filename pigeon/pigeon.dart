import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
    dartOut: 'lib/pigeon.dart',
    swiftOut: "ios/Classes/pigeon.swift",
    kotlinOut: "android/src/main/kotlin/com/hkbea/bcm_native_toast/Pigeon.kt",
    kotlinOptions: KotlinOptions(package: "com.hkbea.bcm_native_toast")))
class Message {
  final String text;
  Message({required this.text});
}

@HostApi()
abstract class BcmHostApi {
  bool showToast(Message msg);
}
