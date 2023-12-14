import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({super.key,
    required this.title,
    required this.colorCodeText,
    required this.colorCodeBackGround,
    required this.onClick,
  });

  final String title;
  final String colorCodeText;
  final String colorCodeBackGround;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: TextButton(
          onPressed: onClick,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(title,
                style: TextStyle(
                  fontSize: 12.0,
                  color: HexColor(colorCodeText),
                )),
          ),
        ),
        decoration: BoxDecoration(
            color: HexColor(colorCodeBackGround),
            borderRadius: const BorderRadius.all(Radius.circular(4))));
  }
}
