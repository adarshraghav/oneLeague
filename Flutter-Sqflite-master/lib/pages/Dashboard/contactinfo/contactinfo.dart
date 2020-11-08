import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/pages/Dashboard/top.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:validators/validators.dart' as validator;
import 'package:intl/intl.dart';
import 'chelper.dart';
import 'cmodel.dart';

class Cinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestForm(),
    );
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          CountryListPick(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: Text('Pick a country'),
            ),
            theme: CountryTheme(
              isShowFlag: true,
              isShowTitle: true,
              isShowCode: true,
              isDownIcon: true,
              showEnglishName: true,
            ),
            initialSelection: '+91',
            onChanged: (CountryCode code) {
              print(code.name);
              print(code.code);
              print(code.dialCode);
              print(code.flagUri);
            },
          ),
          MyTextFormField(
            hintText: 'Enter your number',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter your number';
              }
              return null;
            },
            onSaved: (String value) {
              model.number = value;
            },
          ),
          MyTextFormField(
            hintText: 'Address line 1',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter your address';
              }
              return null;
            },
            onSaved: (String value) {
              model.line1 = value;
            },
          ),
          MyTextFormField(
            hintText: 'Address line 2',
            onSaved: (String value) {
              model.line2 = value;
            },
          ),
          MyTextFormField(
            hintText: 'City',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter your city';
              }
              return null;
            },
            onSaved: (String value) {
              model.city = value;
            },
          ),
          MyTextFormField(
            hintText: 'Province/State',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter your province/state';
              }
              return null;
            },
            onSaved: (String value) {
              model.state = value;
            },
          ),
          MyTextFormField(
            hintText: 'Zip',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter your zip code';
              }
              return null;
            },
            onSaved: (String value) {
              model.zip = value;
            },
          ),
          RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                                model: this.model,
                              )));
                }
              },
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}

class Result extends StatelessWidget {
  Model model;

  Result({this.model});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Successful')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(model.number, style: TextStyle(fontSize: 22)),
            Text(model.line1, style: TextStyle(fontSize: 22)),
            Text(model.line2, style: TextStyle(fontSize: 22)),
            Text(model.city, style: TextStyle(fontSize: 22)),
            Text(model.state, style: TextStyle(fontSize: 22)),
            Text(model.zip, style: TextStyle(fontSize: 22)),
            RaisedButton(
              color: Colors.blueAccent,
              onPressed: () async {
                List<Map<String, dynamic>> queryRows =
                    await DatabaseHelper.instance.queryAll();
                print(queryRows);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                'See',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              color: Colors.blueAccent,
              onPressed: () async {
                await DatabaseHelper.instance.insert({
                  DatabaseHelper.columnNum: model.number,
                  DatabaseHelper.columnLine1: model.line1,
                  DatabaseHelper.columnLine2: model.line2,
                  DatabaseHelper.columnCity: model.city,
                  DatabaseHelper.columnState: model.state,
                  DatabaseHelper.columnZip: model.zip
                });
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
