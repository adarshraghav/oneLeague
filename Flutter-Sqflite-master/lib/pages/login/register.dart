import 'package:flutter/material.dart';
import 'package:flutter_sqlite/data/database-helper.dart';
import 'package:flutter_sqlite/models/user.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _username, _password;

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: _submit,
      child: new Text("Submit",
          style: TextStyle(color: Colors.white, fontSize: 18)),
      color: Color.fromRGBO(17, 34, 63, 1),
    );

    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              SizedBox(
                height: 315,
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _name = val,
                  decoration: new InputDecoration(labelText: "Enter your name"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val,
                  decoration:
                      new InputDecoration(labelText: "Enter your email"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration:
                      new InputDecoration(labelText: "Create a password"),
                ),
              )
            ],
          ),
        ),
      ],
    );

    return new Scaffold(
      key: scaffoldKey,
      body: Stack(
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
              top: 205,
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Colors.white,
                    debugLabel: 'whiteCupertino title',
                    fontFamily: '.SF UI Display'),
              )),
          Positioned(
              left: 22,
              top: 276,
              child: Text(
                "Its quick and easy",
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
          Align(
            alignment: Alignment.bottomLeft,
            child: loginForm,
          ),
          Positioned(
            top: 565,
            left: 4,
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
        ],
      ),
    );
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        var user = new User(_name, _username, _password, null);
        var db = new DatabaseHelper();
        db.saveUser(user);
        _isLoading = false;
        Navigator.of(context).pushNamed("/login");
      });
    }
  }
}
