import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yor_xiu_common/yor_xiu_common_method_channel.dart';

void main() {
  MethodChannelYorXiuCommon platform = MethodChannelYorXiuCommon();
  const MethodChannel channel = MethodChannel('yor_xiu_common');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
