import 'package:flutter/material.dart';
import 'package:mequi/Transactions/pages/pages.dart';
import 'package:mequi/Utils/values/values.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: {
        "/": (_) => const HomePage(),
      },
      initialRoute: "/",
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(colorPimary)),
      ),
    );
  }
}
