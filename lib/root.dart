import 'package:flutter/services.dart';

class Root {
  static const MethodChannel _channel = const MethodChannel('root');

  static Future<String?> exec({String? cmd}) async {
    String? result = await _channel.invokeMethod('ExecuteCommand', {"cmd": cmd});
    return result;
  }

  static Future<bool?> isRooted() async {
    bool? result = await _channel.invokeMethod("isRooted");
    return result;
  }
}
