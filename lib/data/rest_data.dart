import 'dart:async';

import 'package:sqflite_flutter_app/Utils/NetworkUtil.dart';
import 'package:sqflite_flutter_app/model/User.dart';

class ResetData{
  NetworkUtil _netUtil=new NetworkUtil();
  static final BASE_URL="";
  static final LOGIN_URL=BASE_URL+"";

  Future<User> login(String username,String password){

    return new Future.value(new User(username, password));
  }

}