import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mequi/Transactions/pages/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _navigation("page"),
        ],
      ),
    );
  }

  Widget _navigation(String page) {
    return AccountPage();
  }
}
