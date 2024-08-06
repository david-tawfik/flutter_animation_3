import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
  });
  final dynamic foregroundColor;
  final dynamic backgroundColor;
  final dynamic borderColor;
  final dynamic text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
        },
      
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(foregroundColor),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide(
                color: borderColor,
              ),
            ),
                        ),
        ),
        child: Text(text),
      ),
    );
  }
}
