import 'package:flutter/material.dart';

ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: const Color(0xff0C3866),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
    );

ButtonStyle get secondaryButtonStyle => ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: const Color(0xff007cc0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
    );

ButtonStyle get tertiaryButtonStyle => ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: const Color(0xff13A9B4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
    );

ButtonStyle get secondaryOutlinedButtonStyle => OutlinedButton.styleFrom(
      foregroundColor: const Color(0xff007cc0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      side: const BorderSide(
        width: 2,
        color: Color(0xff007cc0),
      ),
      padding: const EdgeInsets.all(10),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );

ButtonStyle get deleteButtonStyle => ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: const Color(0xffDD585F),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
    );
