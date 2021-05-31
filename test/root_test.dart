import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:root/root.dart';

void main() {
  const MethodChannel channel = MethodChannel('root');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  /*test('getPlatformVersion', () async {
    expect(await Root.platformVersion, '42');
  });*/
}
