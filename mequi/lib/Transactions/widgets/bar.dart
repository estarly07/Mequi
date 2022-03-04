import 'package:flutter/cupertino.dart';
import 'package:mequi/Utils/values/colors.dart';

class Bar extends StatelessWidget {
  const Bar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.02,
        horizontal: size.height * 0.015,
      ),
      height: size.height * 0.075,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Color(colorShadow),
              spreadRadius: -2,
            )
          ],
          color: Color(colorBar),
          borderRadius: BorderRadius.circular(size.height * 0.1)),
    );
  }
}
