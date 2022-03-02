import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionsHome extends StatelessWidget {
  const OptionsHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ItemOptionsHome(
          width: size.width * 0.26,
        ),
        _ItemOptionsHome(
          width: size.width * 0.26,
        ),
        _ItemOptionsHome(
          width: size.width * 0.26,
        ),
      ],
    );
  }
}

class _ItemOptionsHome extends StatelessWidget {
  final double width;

  const _ItemOptionsHome({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: [
          Icon(
            Icons.adb_rounded,
            size: width * 0.8,
          ),
          Text(
            "Hola",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}
