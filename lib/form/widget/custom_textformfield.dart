import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final Function onSaved;
  final Function validator;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  bool isObscure;
  bool isPassword;

  CustomTextFormField({
    @required this.label,
    this.keyboardType,
    @required this.onSaved,
    this.validator,
    this.prefixIcon,
    this.isObscure = false,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: widget.prefixIcon,
          suffixIcon: Visibility(
            visible: widget.isPassword,
            child: IconButton(
              icon: Icon(
                widget.isObscure ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                widget.isObscure = !widget.isObscure;
                setState(() {});
              },
            ),
          ),
        ),
        keyboardType: widget.keyboardType,
        obscureText: widget.isObscure,
        cursorHeight: cursorHeight,
        onSaved: widget.onSaved,
        validator: widget.validator,
      ),
    );
  }
}
