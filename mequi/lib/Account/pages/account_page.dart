import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mequi/Account/widgets/widgets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderHome(),
          OptionsHome(),
        ],
      ),
    );
  }
}
