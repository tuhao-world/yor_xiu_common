
import 'yor_xiu_common_platform_interface.dart';

enum Ref{
  dev,test,pro
}

class Config{
  static const Ref _ref = Ref.dev;
  static const String _devUrl = '';
  static const String _testUrl = '';
  static const String _proUrl = '';
}


class YorXiuCommon {
  Future<String?> getPlatformVersion() {
    return YorXiuCommonPlatform.instance.getPlatformVersion();
  }

  Ref getRef(){
    return Config._ref;
  }

  String getBaseUrl(){
    if(Config._ref == Ref.dev){
      return Config._devUrl;
    } else if(Config._ref == Ref.dev){
      return Config._testUrl;
    }else{
      return Config._proUrl;
    }
  }
}
