import 'package:flutter/material.dart';
import 'package:quizionare/styles/style.dart';

class TextPrimary extends StatelessWidget {
  final String text;

  TextPrimary({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: kTextPrimary,
    );
  }
}

class TextSecondary extends StatelessWidget {
  final String text;

  TextSecondary({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: kTextWhite,
    );
  }
}
