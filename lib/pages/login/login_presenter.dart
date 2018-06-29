import 'package:sqflite_flutter_app/data/rest_data.dart';
import 'package:sqflite_flutter_app/model/User.dart';

abstract class LoginPageContract{
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPagePresenter{
  LoginPageContract _view;
  ResetData api= new ResetData();
  LoginPagePresenter(this._view);
  doLogin(String username,String password){
    api.login(username, password)
        .then((user)=>_view.onLoginSuccess(user))
        .catchError((onError)=>_view.onLoginError(onError));

  }
}