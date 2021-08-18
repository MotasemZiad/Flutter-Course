import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';
import 'package:flutter_gsg_01/form/widget/custom_textformfield.dart';
import 'package:flutter_gsg_01/navigation/auth/model/user.dart';
import 'package:flutter_gsg_01/navigation/home/home_screen.dart';

enum UserType {
  Customer,
  Merchant,
}

class RegisterScreen extends StatefulWidget {
  @override
  _Form3ScreenState createState() => _Form3ScreenState();
}

class _Form3ScreenState extends State<RegisterScreen> {
  UserType userType;
  User _user;

  get user => this._user;
  set user(User user) => this._user = user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Register',
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
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: Text(
                          'Customer',
                          style: TextStyle(
                            color: colorPrimary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Source Sans Pro',
                          ),
                        ),
                        value: UserType.Customer,
                        groupValue: userType,
                        onChanged: (value) {
                          userType = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                          title: Text(
                            'Merchant',
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Source Sans Pro',
                            ),
                          ),
                          value: UserType.Merchant,
                          groupValue: userType,
                          onChanged: (value) {
                            userType = value;
                            setState(() {});
                          }),
                    ),
                  ],
                ),
                this.userType == UserType.Customer
                    ? CustomerForm()
                    : MerchantForm(),
                SizedBox(
                  height: 24.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Source Sans Pro',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomerForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: 'Username',
          onSaved: (value) {},
          keyboardType: TextInputType.name,
          prefixIcon: Icon(
            Icons.perm_identity,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        CustomTextFormField(
          label: 'Email',
          onSaved: (value) {},
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(
            Icons.email,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        CustomTextFormField(
          label: 'Password',
          onSaved: (value) {},
          prefixIcon: Icon(
            Icons.lock,
          ),
          isObscure: true,
          isPassword: true,
        ),
        SizedBox(
          height: 4.0,
        ),
        CustomTextFormField(
          label: 'Phone',
          onSaved: (value) {},
          keyboardType: TextInputType.phone,
          prefixIcon: Icon(
            Icons.phone,
          ),
        ),
      ],
    );
  }
}

class MerchantForm extends StatefulWidget {
  @override
  _MerchantFormState createState() => _MerchantFormState();
}

class _MerchantFormState extends State<MerchantForm> {
  final List categories = [
    'Fashion',
    'Shoes',
    'Male',
    'Female',
    'Children',
    'Gadgets',
    'Gaming',
    'Devices',
  ];

  String dropDownValue = 'Fashion';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: 'Username',
          onSaved: (value) {},
          keyboardType: TextInputType.name,
          prefixIcon: Icon(
            Icons.perm_identity,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        CustomTextFormField(
          label: 'Email',
          onSaved: (value) {},
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(
            Icons.email,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        CustomTextFormField(
          label: 'Password',
          onSaved: (value) {},
          prefixIcon: Icon(
            Icons.lock,
          ),
          isObscure: true,
          isPassword: true,
        ),
        SizedBox(
          height: 4.0,
        ),
        CustomTextFormField(
          label: 'Phone',
          onSaved: (value) {},
          keyboardType: TextInputType.phone,
          prefixIcon: Icon(
            Icons.phone,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        CustomTextFormField(
          label: 'Shop Name',
          onSaved: (value) {},
          keyboardType: TextInputType.name,
          prefixIcon: Icon(
            Icons.shop,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          child: DropdownButton<String>(
            value: this.dropDownValue,
            isExpanded: true,
            elevation: 6,
            hint: Text('Categories'),
            icon: Icon(Icons.category),
            iconEnabledColor: colorPrimary,
            items: categories.map((e) {
              return DropdownMenuItem<String>(
                child: Text(e),
                value: e,
              );
            }).toList(),
            onChanged: (value) {
              this.dropDownValue = value;
              setState(() {});
            },
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        CustomTextFormField(
          label: 'Bio',
          onSaved: (value) {},
          keyboardType: TextInputType.text,
          prefixIcon: Icon(
            Icons.note,
          ),
        ),
      ],
    );
  }
}
