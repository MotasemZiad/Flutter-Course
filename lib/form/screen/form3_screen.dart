import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';
import 'package:flutter_gsg_01/form/widget/custom_textformfield.dart';

enum UserType {
  Customer,
  Merchant,
}

class Form3Screen extends StatefulWidget {
  @override
  _Form3ScreenState createState() => _Form3ScreenState();
}

class _Form3ScreenState extends State<Form3Screen> {
  UserType user;

  var formKey = GlobalKey<FormState>();
  void saveForm() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form 3 Screen'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: Text(
                          'Customer',
                          style: TextStyle(
                            color: colorPrimary.withGreen(125),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Source Sans Pro',
                          ),
                        ),
                        value: UserType.Customer,
                        groupValue: user,
                        onChanged: (value) {
                          user = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                          title: Text(
                            'Merchant',
                            style: TextStyle(
                              color: colorPrimary.withGreen(125),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Source Sans Pro',
                            ),
                          ),
                          value: UserType.Merchant,
                          groupValue: user,
                          onChanged: (value) {
                            user = value;
                            setState(() {});
                          }),
                    ),
                  ],
                ),
                this.user == UserType.Customer
                    ? CustomerForm()
                    : MerchantForm(),
                SizedBox(
                  height: 24.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Source Sans Pro',
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
          label: 'Home',
          onSaved: (value) {},
          keyboardType: TextInputType.name,
          prefixIcon: Icon(
            Icons.home,
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
          label: 'Home',
          onSaved: (value) {},
          keyboardType: TextInputType.name,
          prefixIcon: Icon(
            Icons.home,
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
