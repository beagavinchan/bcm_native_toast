import Flutter
import UIKit

public class BcmNativeToastPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bcm_native_toast", binaryMessenger: registrar.messenger())
    let instance = BcmNativeToastPlugin()
    let api = BcmHostApiImpl()
    BcmHostApiSetup.setUp(binaryMessenger:registrar.messenger(),api:api)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
