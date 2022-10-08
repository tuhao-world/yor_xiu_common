

import 'package:yor_xiu_common/utils/sp_util.dart';

class TokenHelper{
  static String? token;
  static void setToken(String token){
    token = token;
  }

  static void initToken(){
    if(token == null){
      token = SPUtil.instance.getString('token');
    }else if(token!.isEmpty){
      token = SPUtil.instance.getString('token');
    }
  }
}