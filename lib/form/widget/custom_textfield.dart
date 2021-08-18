import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Function onSubmitted;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  bool isObscure;
  bool isPassword;

  CustomTextField({
    @required this.label,
    @required this.controller,
    this.keyboardType,
    this.onSubmitted,
    this.prefixIcon,
    this.isObscure = false,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: widget.controller,
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
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}
