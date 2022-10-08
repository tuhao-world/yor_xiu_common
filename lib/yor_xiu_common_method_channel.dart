import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'yor_xiu_common_platform_interface.dart';

/// An implementation of [YorXiuCommonPlatform] that uses method channels.
class MethodChannelYorXiuCommon extends YorXiuCommonPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('yor_xiu_common');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }


}
