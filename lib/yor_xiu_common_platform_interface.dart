import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'yor_xiu_common_method_channel.dart';

abstract class YorXiuCommonPlatform extends PlatformInterface {
  /// Constructs a YorXiuCommonPlatform.
  YorXiuCommonPlatform() : super(token: _token);

  static final Object _token = Object();

  static YorXiuCommonPlatform _instance = MethodChannelYorXiuCommon();

  /// The default instance of [YorXiuCommonPlatform] to use.
  ///
  /// Defaults to [MethodChannelYorXiuCommon].
  static YorXiuCommonPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [YorXiuCommonPlatform] when
  /// they register themselves.
  static set instance(YorXiuCommonPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
