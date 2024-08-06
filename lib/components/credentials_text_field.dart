import 'package:flutter/material.dart';

class CredentialsTextFIeld extends StatelessWidget {
  const CredentialsTextFIeld({
    super.key,
    this.obscureText,
    this.suffixIcon,
    required this.hintText,
    required this.prefixIcon,

  });
  final dynamic hintText;
  final dynamic prefixIcon;
  final dynamic obscureText;
  final dynamic suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIconColor: Colors.pink,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
        ),
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400
          ),
        ),
    
      ),
    );
  }
}

