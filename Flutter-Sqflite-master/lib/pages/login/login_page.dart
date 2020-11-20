import 'package:flutter/material.dart';
import 'package:flutter_sqlite/data/database-helper.dart';
import 'package:flutter_sqlite/models/user.dart';
import 'package:flutter_sqlite/pages/login/login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();

  String _email, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _register() {
    Navigator.of(context).pushNamed("/register");
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_email, _password);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: _submit,
      child: new Text(
        "Login",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      color: Color.fromRGBO(17, 34, 63, 1),
    );
    var registerBtn = new RaisedButton(
      elevation: 0,
      hoverColor: Colors.blue,
      padding: const EdgeInsets.all(0.0),
      onPressed: _register,
      child: new Text(
        "Sign Up",
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      color: Colors.white,
    );
    var loginForm = new Column(
      children: <Widget>[
        SizedBox(
          height: 330,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _email = val,
                  decoration: new InputDecoration(
                    labelText: "Enter your email",
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration:
                      new InputDecoration(labelText: "Enter your password"),
                ),
              )
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: -50,
              left: 0,
              child: Container(
                height: 400,
                width: 400,
                child: Image.asset(
                  "assets/background.jpg",
                  height: 500,
                  width: 500,
                ),
              ),
            ),
            Positioned(
                left: 10,
                top: 220,
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.white,
                      debugLabel: 'whiteCupertino title',
                      fontFamily: '.SF UI Display'),
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: loginForm,
            ),
            Positioned(
              top: 520,
              left: 15,
              child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: loginBtn,
                    height: 50,
                    width: 100,
                  )),
            ),
            Positioned(
                top: 726, left: 106, child: Text("Dont have an account ?")),
            Positioned(top: 710, left: 260, child: registerBtn)
          ],
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    setState(() {
      _isLoading = false;
    });
    if (user.flaglogged == "logged") {
      print("Logged");
      Navigator.of(context).pushNamed("/home");
    } else {
      print("Not Logged");
    }
  }
}
