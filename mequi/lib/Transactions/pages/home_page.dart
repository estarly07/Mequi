import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mequi/Transactions/widgets/widgets.dart';
import 'package:mequi/Utils/values/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _Header(),
          OptionsHome(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.55,
      width: double.infinity,
      child: CustomPaint(
        painter: PurpleHeader(),
      ),
    );
  }
}

class PurpleHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
      ..color = Color(colorPimary)
      ..style = PaintingStyle.fill;
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);

    path.quadraticBezierTo(size.width * 0.95, size.height * 0.85,
        size.width * 0.85, size.height * 0.8);
    path.lineTo(size.width * 0.2, size.height * 0.47);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.42,
        size.width * 0.15, size.height * 0.35);

    path.lineTo(size.width * 0.3, size.height * 0.1);
    path.lineTo(0, size.height * 0.1);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
