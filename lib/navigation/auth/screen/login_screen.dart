import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';
import 'package:flutter_gsg_01/form/widget/custom_textformfield.dart';
import 'package:flutter_gsg_01/navigation/auth/model/user.dart';
import 'package:flutter_gsg_01/navigation/auth/screen/register_screen.dart';
import 'package:flutter_gsg_01/navigation/home/home_screen.dart';
import 'package:string_validator/string_validator.dart';

enum Gender {
  MALE,
  FEMALE,
}

class LoginScreen extends StatefulWidget {
  @override
  _Form2ScreenState createState() => _Form2ScreenState();
}

class _Form2ScreenState extends State<LoginScreen> {
  User user;
  Gender gender;
  String _email, _password;

  set email(String email) => this._email = email;
  set password(String password) => this._password = password;

  get email => this._email;
  get password => this._password;

  var formKey = GlobalKey<FormState>();
  void saveForm() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.pushNamed(context, '/home'); // * push a named route
      // Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('name')); // * to navigate into a new route and remove all the routes between them
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: colorPrimary,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  CustomTextFormField(
                    label: 'Email',
                    onSaved: (newValue) {
                      email = newValue;
                      print('Email onSaved function done');
                    },
                    validator: (value) {
                      if (value.length == 0) {
                        return 'Required Field!';
                      }
                      if (!isEmail(value)) {
                        return 'Invalid Email!';
                      }
                    },
                    prefixIcon: Icon(Icons.email),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  CustomTextFormField(
                    label: 'Password',
                    onSaved: (newValue) {
                      password = newValue;
                      print('Password onSaved function done');
                    },
                    validator: (value) {
                      if (value.length == 0) {
                        return 'Required Field!';
                      }
                      if (value.length < 6) {
                        return 'Password should be more than 6 character';
                      }
                    },
                    isObscure: true,
                    isPassword: true,
                    prefixIcon: Icon(Icons.lock),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gender',
                      style: TextStyle(
                        color: colorPrimary,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RadioListTile(
                    value: Gender.MALE,
                    groupValue: gender,
                    onChanged: (value) {
                      gender = value;
                      setState(() {});
                    },
                    title: Text('Male'),
                  ),
                  RadioListTile(
                    value: Gender.FEMALE,
                    groupValue: gender,
                    onChanged: (value) {
                      gender = value;
                      setState(() {});
                    },
                    title: Text('Female'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      saveForm();
                      setState(() {});
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Doesn\'t have an account yet?',
                          style: TextStyle(fontSize: 16.0)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: colorPrimary,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
