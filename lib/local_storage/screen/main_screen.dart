import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/form/widget/custom_textfield.dart';
import 'package:flutter_gsg_01/local_storage/helper/files_helper.dart';
import 'package:flutter_gsg_01/local_storage/helper/shared_preferences_helper.dart';
import 'package:get_it/get_it.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  final names = [
    'mohammed',
    'ahmed',
    'mahmoud',
    'motasem',
  ];

  bool isVisible = false;

  showSnackBar(BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void validateInputs(BuildContext context) {
    if (usernameController.text.isEmpty || emailController.text.isEmpty) {
      showSnackBar(context, 'Please fill fields', Colors.red);
    } else if (!emailController.text.contains(RegExp(
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$"))) {
      showSnackBar(context, 'Please enter a valid email address', Colors.red);
    } else {
      GetIt.I
          .get<SharedPreferencesHelper>()
          .setUsername(usernameController.text);
      GetIt.I.get<SharedPreferencesHelper>().setEmail(emailController.text);
      isVisible = true;

      showSnackBar(context, 'Data saved successfully', Colors.green);
      usernameController.clear();
      emailController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                label: 'Username',
                controller: usernameController,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 4.0,
              ),
              CustomTextField(
                label: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      validateInputs(context);
                      FilesHelper.filesHelper.readFromFile('GSG');
                    });
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: 8.0,
              ),
              Visibility(
                visible: isVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Username:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      GetIt.I.get<SharedPreferencesHelper>().getUsername(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Visibility(
                visible: isVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Email:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      GetIt.I.get<SharedPreferencesHelper>().getEmail(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
