import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ButtonCircleCusttom extends StatelessWidget {
  const ButtonCircleCusttom({
    Key? key,
    required this.text,
    required this.click,
    required this.textColor,
    required this.backgroundColor,
  }) : super(key: key);

  final String text;
  final int textColor;
  final int backgroundColor;
  final Function click;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.all(size.height * 0.02),
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.06,
        horizontal: size.width * 0.055,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height),
        color: Color(backgroundColor),
      ),
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(textColor),
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.02)),
    );
  }
}
