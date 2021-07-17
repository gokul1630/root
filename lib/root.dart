import 'package:flutter/services.dart';

class Root {
  static const MethodChannel _channel = const MethodChannel('root');

// Function to Run shell commands
  static Future<String?> exec({String? cmd}) async {
    String? result = await _channel.invokeMethod('ExecuteCommand', {"cmd": cmd});
    return result;
  }
// Function to check Root status
  static Future<bool?> isRooted() async {
    bool? result = await _channel.invokeMethod("isRooted");
    return result;
  }
}
