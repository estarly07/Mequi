import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mequi/Transactions/widgets/bar.dart';
import 'package:mequi/Utils/values/colors.dart';

class DialogTransactions extends StatefulWidget {
  const DialogTransactions({Key? key}) : super(key: key);

  @override
  State<DialogTransactions> createState() => _DialogTransactionsState();
}

class _DialogTransactionsState extends State<DialogTransactions>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
      upperBound: 1.3,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: _controller,
        child: Scaffold(
            backgroundColor: const Color(colorPimary).withOpacity(0.9),
            body: Align(
              alignment: Alignment.bottomCenter,
              child: Wrap(
                alignment: WrapAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: size.height * 0.005,
                      right: size.width * 0.075,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        floating("Saca", Icons.arrow_downward, size),
                        floating("Pide", Icons.arrow_back, size),
                        floating("Envía", Icons.arrow_forward_rounded, size),
                        floating("Código QR", Icons.qr_code, size),
                        floating("Recarga Nequi", Icons.arrow_upward, size),
                        FloatingActionButton(
                          onPressed: () {
                            _controller.reverse().then(
                                  (value) => Navigator.of(context).pop(),
                                );
                          },
                          backgroundColor: const Color(colorBlueLight),
                          elevation: 10.5,
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  const Opacity(opacity: 0, child: Bar())
                ],
              ),
            )),
        builder: (_, child) {
          return ClipPath(
            clipper: _MyClipper(_controller.value),
            child: child,
          );
        });
  }

  Widget floating(String title, IconData icon, Size size) => Container(
        margin: EdgeInsets.only(bottom: size.width * 0.06),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title,
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  color: const Color(textPrimaryWhite),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.025),
              width: size.width * 0.065,
              height: size.width * 0.065,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(colorPink),
              ),
              child: Center(
                  child: Icon(
                icon,
                color: const Color(colorBar),
                size: size.width * 0.04,
              )),
            ),
          ],
        ),
      );
}

class _MyClipper extends CustomClipper<Path> {
  _MyClipper(this.value);
  final double value;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width * 0.85, size.height * 0.84),
        radius: value * size.height));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
