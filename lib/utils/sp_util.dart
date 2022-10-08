
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yor_xiu_common/config/top_level_obj.dart';

///封装sp
///
class SPUtil{
  static SPUtil? _spUtil;
  SharedPreferences? prefs;


  ///创建私有的构造方法，仅供当前类使用 避免外部初始化
  SPUtil._internal();

  ///由于dart为单线程模型，所有代码均运行在同一个isolate中
  ///这里不考虑线程安全的创建方式
  static SPUtil get instance {
    _spUtil ??= SPUtil._internal();
    return _spUtil!;
  }


  Future<void> init()async{
    prefs ??= await SharedPreferences.getInstance();
    logger.i('初始化sp');
  }


  Future<bool?> put<T>(String key, T value)async{
    if(value is String){
      print('保存string');
      prefs?.setString(key, value).onError((error, stackTrace){
        logger.e('保存sp异常：${error.toString()}');
        return Future.value(false);
      });
      return prefs?.setString(key, value);
    }
    if(value is int){
      return prefs?.setInt(key, value);
    }
    if(value is bool){
      return prefs?.setBool(key, value);
    }
    if(value is double){
      return prefs?.setDouble(key, value);
    }
    if(value is List<String>){
      return prefs?.setStringList(key, value);
    }
    return Future.value(false);
  }

  T get<T>(String key){
    Object? data;
    if(T is String){
      data = prefs?.getString(key);
      print('获取string');
    }
    if(T is int){
      data = prefs?.getInt(key);
    }
    if(T is bool){
      data = prefs?.getBool(key);
    }
    if(T is double){
      data = prefs?.getDouble(key);
    }
    if(T is List<String>){
      data = prefs?.getStringList(key);
    }
    if(data==null){
      return '' as T;
    }
    return data as T;
  }



  String getString(String key){
    return prefs?.getString(key)??'';
  }
  int getInt(String key){
    return prefs?.getInt(key)??0;
  }
  bool getBool(String key){
    return prefs?.getBool(key)??false;
  }
  double getDouble(String key){
    return prefs?.getDouble(key)??0;
  }
  List<String> getList(String key){
    return prefs?.getStringList(key)??[];
  }


  Future<bool> remove(String key)async{
    return await prefs?.remove(key)??false;
  }

}
