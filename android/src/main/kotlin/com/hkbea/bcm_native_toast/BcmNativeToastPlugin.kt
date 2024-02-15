package com.hkbea.bcm_native_toast

import androidx.annotation.NonNull

import android.widget.Toast
import android.content.Context
import android.util.Log

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** BcmNativeToastPlugin */
class BcmNativeToastPlugin: FlutterPlugin, MethodCallHandler, BcmHostApi {
  lateinit var context: Context

  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "bcm_native_toast")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
    BcmHostApi.setUp(flutterPluginBinding.binaryMessenger, this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    BcmHostApi.setUp(binding.binaryMessenger, null)
  }

  override fun showToast(msg: Message): Boolean{
    val toast = Toast.makeText(context, msg.text, Toast.LENGTH_SHORT)
    toast.show()
    return true
  }
}
