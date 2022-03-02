import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_Header(), _OptionsHome()],
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
    return Container(
      height: 300,
      color: Colors.red,
    );
  }
}

class _OptionsHome extends StatelessWidget {
  const _OptionsHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ItemOptionsHome(sizes: [110, 120]),
          _ItemOptionsHome(sizes: [110, 120]),
          _ItemOptionsHome(sizes: [110, 120]),
        ],
      ),
    );
  }
}

class _ItemOptionsHome extends StatelessWidget {
  final List<double> sizes;

  const _ItemOptionsHome({
    Key? key,
    required this.sizes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes[0],
      height: sizes[1],
      color: Colors.pink,
    );
  }
}
