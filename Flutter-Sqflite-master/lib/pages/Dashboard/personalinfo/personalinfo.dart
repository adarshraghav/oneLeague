import 'package:flutter/material.dart';
import 'package:flutter_sqlite/pages/Dashboard/top.dart';
import 'shelper.dart';
import 'package:validators/validators.dart' as validator;
import 'pmodel.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp10());

class MyApp10 extends StatelessWidget {
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
      body: Stack(children: [
        Positioned(
          bottom: 10,
          height: 255,
          child: Image.asset('assets/waves.png'),
        ),
        TestForm()
      ]),
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
  // Declare this variable
  static int selectedRadio;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  // Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            "Personal Information",
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  //field for first name
                  child: MyTextFormField(
                    hintText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.firstName = value;
                    },
                  ),
                ),

                //field for last name
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Last Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.lastName = value;
                    },
                  ),
                )
              ],
            ),
          ),
          //field for email
          MyTextFormField(
            hintText: 'Email',
            isEmail: true,
            validator: (String value) {
              if (!validator.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (String value) {
              model.email = value;
            },
          ),
          //field for date of birth
          Padding(
              padding: EdgeInsets.all(10.0),
              child: DateTimeField(
                validator: (value) {
                  if ((value.toString().isEmpty) ||
                      (DateTime.tryParse(value.toString()) == null)) {
                    return 'Please enter a valid date';
                  }
                  return null;
                },
                format: format,
                decoration: InputDecoration(labelText: 'Date of birth'),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
              )),
          SizedBox(
            height: 5,
          ),
          //field for gender
          Container(
            child: Text(
              "Gender:",
              style: TextStyle(fontSize: 16),
            ),
            alignment: Alignment(-0.92, 0),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: selectedRadio,
                activeColor: Colors.green,
                onChanged: (val) {
                  model.gender = "Male";
                  setSelectedRadio(val);
                },
              ),
              Text("Male"),
              Radio(
                value: 2,
                groupValue: selectedRadio,
                activeColor: Colors.blue,
                onChanged: (val) {
                  model.gender = "Female";
                  setSelectedRadio(val);
                },
              ),
              Text("Female"),
            ],
          ),
          //field for year of graduation
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              "When did/will you graduate from highschool?",
              style: TextStyle(fontSize: 16),
            ),
            alignment: Alignment(-0.2, 0),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: DateTimeField(
                validator: (value) {
                  if ((value.toString().isEmpty) ||
                      (DateTime.tryParse(value.toString()) == null)) {
                    return 'Please enter a valid date';
                  }
                  return null;
                },
                format: format,
                decoration: InputDecoration(labelText: 'Date'),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2021));
                },
                onSaved: (value) {
                  model.bod = value.toString();
                },
              )),
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
      body: Stack(
        children: [
          Positioned(
            top: 50,
            right: 12,
            child: Column(
              children: <Widget>[
                Row(children: [
                  Icon(Icons.account_circle_sharp),
                  SizedBox(
                    width: 5,
                  ),
                  Text('First Name: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(model.firstName, style: TextStyle(fontSize: 20))
                ]),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 130.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Icon(Icons.account_circle_sharp),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Last Name: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(model.lastName, style: TextStyle(fontSize: 20))
                ]),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 130.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Icon(Icons.email),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Email: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(model.email, style: TextStyle(fontSize: 20))
                ]),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 250.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Icon(Icons.face),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Gender: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(model.gender, style: TextStyle(fontSize: 20))
                ]),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: 100.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Icon(Icons.cake),
                  SizedBox(
                    width: 5,
                  ),
                  Text('BOD: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(model.bod, style: TextStyle(fontSize: 20))
                ]),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 350,
              right: 50,
              child: RaisedButton(
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
              )),
          Positioned(
            left: 50,
            bottom: 350,
            child: RaisedButton(
              color: Colors.blueAccent,
              onPressed: () async {
                int i = await DatabaseHelper.instance.insert({
                  DatabaseHelper.columnFName: model.firstName,
                  DatabaseHelper.columnLName: model.lastName,
                  DatabaseHelper.columnemail: model.email,
                  DatabaseHelper.columndob: model.bod,
                });
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            height: 255,
            child: Image.asset('assets/waves.png'),
          ),
        ],
      ),
    ));
  }
}
