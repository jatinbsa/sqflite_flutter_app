import 'package:flutter/material.dart';
import 'package:sqflite_flutter_app/data/data_base_helper.dart';
import 'package:sqflite_flutter_app/model/User.dart';
import 'package:sqflite_flutter_app/pages/login/login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract{

  BuildContext _ctx;
  bool _isLoading;
  final formkey=new GlobalKey<FormState>();
  final scaffoldKey=new GlobalKey<ScaffoldState>();
  var  _username,_password;
  LoginPagePresenter _presenter;
  _LoginPageState(){
    _presenter=new LoginPagePresenter(this);
  }
  void _submit(){
    final form=formkey.currentState ;

    if(form.validate()){
      setState(() {
        _isLoading=true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }
  void _showSnackbar(String text){
    scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(text)));
  }
  @override
  Widget build(BuildContext context) {
    _ctx=context;
    var loginBtn=new RaisedButton(onPressed: _submit,
     child: new Text("Login"),
      color: Colors.green,

    );
    var loginForm=new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text("Sqflite App Login ",textScaleFactor: 2.0,),
        new Form(
            key: formkey,
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.all(10.0),
                 child: new TextFormField(
                   onSaved: (val)=>_username=val,
                   decoration: new InputDecoration(labelText: "Username"),
                 ),
                ),
                new Padding(padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val)=>_password=val,
                    decoration: new InputDecoration(labelText: "Password"),
                  ),
                ),

              ],
            )
        ),
        loginBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(title: new Text("Login Page"),

      ),
      key: scaffoldKey,
      body:new Container(
        child:new Center(
          child: loginForm,
        ),
      ) ,
    );

  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackbar(error);
  }

  @override
  void onLoginSuccess(User user) async{
    // TODO: implement onLoginSuccess
    _showSnackbar(user.toString());
    setState(() {
      _isLoading=false;


    });
    var db=new DatabaseHelper();
    await db.saveUser(user);
    Navigator.of(context).pushNamed("/home");
  }
}
