import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mequi/Utils/values/colors.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          _HeaderPurple(),
          _HeaderPink(size: size),
        ],
      ),
    );
  }
}

class _HeaderPink extends StatelessWidget {
  const _HeaderPink({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.5,
          width: double.infinity,
          child: CustomPaint(
            painter: PinkFigure(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.025, left: size.height * 0.045),
          child: Text(
            "Hola,\nEstarly",
            style: TextStyle(
                height: 1.8,
                fontWeight: FontWeight.bold,
                color: Color(textPrimaryWhite),
                fontSize: size.height * 0.02),
          ),
        ),
      ],
    );
  }
}

class _HeaderPurple extends StatelessWidget {
  const _HeaderPurple({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.5,
          width: double.infinity,
          child: CustomPaint(
            painter: PurpleFigure(),
          ),
        ),
        Positioned(
            right: 0,
            child: Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.065, right: size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _textInfo(
                      "Disponible", "\$ 8.951.004,31", true, size.width * 0.05),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  _textInfo(
                      "Total", "\$ 8.951.004,31", false, size.width * 0.05),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Transform.rotate(
                      angle: 4.7,
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ))
                ],
              ),
            ))
      ],
    );
  }

  Column _textInfo(
    String title,
    String amount,
    bool boldActive,
    double textSize,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(color: const Color(textSecondaryWhite)),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          amount,
          style: TextStyle(
              color: Color(boldActive ? textPrimaryWhite : textSecondaryWhite),
              fontWeight: boldActive ? FontWeight.bold : FontWeight.normal,
              fontSize: boldActive ? textSize * 1.5 : textSize),
        ),
      ],
    );
  }
}

class PurpleFigure extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
      ..color = Color(colorPimary)
      ..style = PaintingStyle.fill;
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.65);

    path.quadraticBezierTo(size.width * 0.95, size.height * 0.71,
        size.width * 0.85, size.height * 0.67);
    path.lineTo(size.width * 0.15, size.height * 0.42);
    path.quadraticBezierTo(size.width * 0.07, size.height * 0.37,
        size.width * 0.1, size.height * 0.28);

    path.lineTo(size.width * 0.27, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PinkFigure extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
      ..color = const Color(colorPink)
      ..style = PaintingStyle.fill;
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.width * 0.15, size.height * 0.32);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.36,
        size.width * 0.25, size.height * 0.32);
    path.lineTo(size.width * 0.45, size.height * 0.08);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.03, size.width * 0.45, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
