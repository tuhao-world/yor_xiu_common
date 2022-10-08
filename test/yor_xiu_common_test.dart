import 'package:flutter_test/flutter_test.dart';
import 'package:yor_xiu_common/yor_xiu_common.dart';
import 'package:yor_xiu_common/yor_xiu_common_platform_interface.dart';
import 'package:yor_xiu_common/yor_xiu_common_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockYorXiuCommonPlatform 
    with MockPlatformInterfaceMixin
    implements YorXiuCommonPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final YorXiuCommonPlatform initialPlatform = YorXiuCommonPlatform.instance;

  test('$MethodChannelYorXiuCommon is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelYorXiuCommon>());
  });

  test('getPlatformVersion', () async {
    YorXiuCommon yorXiuCommonPlugin = YorXiuCommon();
    MockYorXiuCommonPlatform fakePlatform = MockYorXiuCommonPlatform();
    YorXiuCommonPlatform.instance = fakePlatform;
  
    expect(await yorXiuCommonPlugin.getPlatformVersion(), '42');
  });
}
