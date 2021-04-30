import 'package:flutter/material.dart';

final ButtonStyle kButtonPrimary = ElevatedButton.styleFrom(
  primary: Color(0xFF2CDDCC),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
  ),
  shadowColor: Color(0xFF2CDDCC),
);

final ButtonStyle kButtonSecondary = ElevatedButton.styleFrom(
  primary: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
    side: BorderSide(
      color: Color(0xFF2CDDCC),
    ),
  ),
);

final TextStyle kTextPrimary = TextStyle(
  color: Color(0xFF2CDDCC),
  fontSize: 16,
);

final TextStyle kTextWhite = TextStyle(
  color: Colors.white,
  fontSize: 16,
);
