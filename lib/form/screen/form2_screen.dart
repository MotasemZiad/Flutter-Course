import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';
import 'package:flutter_gsg_01/form/widget/custom_textformfield.dart';
import 'package:string_validator/string_validator.dart';

enum Gender {
  MALE,
  FEMALE,
}

class Form2Screen extends StatefulWidget {
  @override
  _Form2ScreenState createState() => _Form2ScreenState();
}

class _Form2ScreenState extends State<Form2Screen> {
  bool isPressed = false;
  Gender gender;
  String _email, _password;

  set email(String email) => this._email = email;
  set password(String password) => this._password = password;

  get email => this._email;
  get password => this._password;

  var formKey = GlobalKey<FormState>();
  void saveForm() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      isPressed = true;
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form 2 Screen'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  label: 'Email',
                  onSaved: (newValue) {
                    email = newValue;
                    print('Email onSaved function done');
                  },
                  validator: (value) {
                    if (value.length == 0) {
                      return 'Required Field!';
                    } else if (!isEmail(value)) {
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
                    } else if (value.length < 6) {
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
                SizedBox(
                  height: 24.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    saveForm();
                    setState(() {});
                  },
                  child: Text('Sign In'),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Visibility(
                    visible: isPressed,
                    child: Center(
                        child: Text(
                      'Email => $email\nPassword => $password',
                      style: TextStyle(fontSize: 24.0),
                    ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
