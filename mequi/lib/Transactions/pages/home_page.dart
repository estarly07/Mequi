import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mequi/Transactions/pages/pages.dart';
import 'package:mequi/Transactions/widgets/widgets.dart';
import 'package:mequi/Utils/values/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _navigation("page"),
          Align(
            alignment: Alignment.bottomCenter,
            child: Wrap(
              alignment: WrapAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: size.height * 0.005,
                    right: size.width * 0.075,
                  ),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, animation, secondAnimation) =>
                              DialogTransactions()));
                    },
                    elevation: 10.5,
                    child: Icon(Icons.attach_money_sharp),
                    backgroundColor: Color(colorPink),
                  ),
                ),
                Bar(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _navigation(String page) {
    return AccountPage();
  }
}
