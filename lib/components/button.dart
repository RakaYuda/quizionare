import 'package:flutter/material.dart';
import 'package:quizionare/styles/style.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  ButtonPrimary({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: kButtonPrimary,
      onPressed: onPressed,
      child: Container(
        height: 64,
        child: Center(
          child: Text(
            text,
            style: kTextWhite,
          ),
        ),
      ),
    );
  }
}
