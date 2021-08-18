import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';
import 'package:flutter_gsg_01/form/screen/form2_screen.dart';
import '../widget/custom_textfield.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool checkboxValue = false;

  showSnackBar(BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void validateInputs(BuildContext context) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackBar(context, 'Please fill fields', Colors.red);
    } else if (passwordController.text.length < 6) {
      showSnackBar(
          context, 'Password Shouldn\'t be less than 6 characters', Colors.red);
    } else if (!emailController.text.contains(RegExp(
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$"))) {
      showSnackBar(context, 'Please enter a valid email address', Colors.red);
    } else {
      showSnackBar(
          context,
          'Email Controller: ${emailController.text}\nPasswordController: ${passwordController.text}',
          colorPrimary);
      emailController.clear();
      passwordController.clear();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Form2Screen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Screen'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: emailController,
              onSubmitted: (_) {},
              keyboardType: TextInputType.name,
              prefixIcon: Icon(Icons.email),
              label: 'Email',
            ),
            SizedBox(
              height: 12.0,
            ),
            CustomTextField(
              controller: passwordController,
              onSubmitted: (_) {},
              isPassword: true,
              isObscure: true,
              prefixIcon: Icon(Icons.lock),
              label: 'Password',
            ),
            SizedBox(
              height: 6.0,
            ),
            CheckboxListTile(
              value: checkboxValue,
              onChanged: (value) {
                checkboxValue = value;
                setState(() {});
              },
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'I agree to the ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms & Conditions ',
                    style: TextStyle(
                      color: colorPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'and ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: colorPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              onPressed: checkboxValue
                  ? () {
                      validateInputs(context);
                    }
                  : null,
              child: Text('Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}

// Simple Comment
// * Important Comment
// ! Red Comment
// ? Blue Comment
// Todo Comment
