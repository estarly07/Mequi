import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mequi/Utils/values/colors.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({
    Key? key,
    required this.hint,
    required this.click,
    required this.inputType,
    this.icon = null,
    this.lenght = 225,
    this.inputFormatter = null,
    this.expanded = false,
  }) : super(key: key);

  final String hint;
  final IconData? icon;
  final Function click;
  final TextInputFormatter? inputFormatter;
  final TextInputType inputType;
  final bool expanded;
  final int lenght;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.width * 0.012,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.width * 0.01,
          horizontal: size.width * 0.05,
        ),
        decoration: BoxDecoration(
          color: Color(colorButtonsBar).withOpacity(0.15),
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: TextFormField(
          maxLength: lenght,
          keyboardType: inputType,
          maxLines: expanded ? null : 1,
          inputFormatters: [
            (inputFormatter != null
                ? inputFormatter!
                : FilteringTextInputFormatter.singleLineFormatter)
          ],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            counterText: "",
            suffixIcon: Icon(icon),
          ),
        ),
      ),
    );
  }
}
