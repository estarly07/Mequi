import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mequi/Utils/values/colors.dart';

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
          name: "Metas",
          icon: "assets/icons/ic_metas.svg",
        ),
        _ItemOptionsHome(
          width: size.width * 0.26,
          name: "Colchón",
          icon: "assets/icons/ic_colchon.svg",
        ),
        _ItemOptionsHome(
          width: size.width * 0.26,
          name: "Bolsillos",
          icon: "assets/icons/ic_bolsillo.svg",
        ),
      ],
    );
  }
}

class _ItemOptionsHome extends StatelessWidget {
  final double width;
  final String name;
  final String icon;

  const _ItemOptionsHome({
    Key? key,
    required this.width,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            height: width * 0.5,
            width: width * 0.5,
          ),
          SizedBox(
            height: width * 0.15,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: width * 0.2, color: Color(colorPimary)),
          )
        ],
      ),
    );
  }
}
