import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mequi/Transactions/pages/pages.dart';
import 'package:mequi/Utils/values/values.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //color de barra de notificacion
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(colorPimary),
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        "/": (_) => const HomePage(),
      },
      initialRoute: "/",
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(colorScaffold),
        iconTheme: IconThemeData(color: Color(colorPimary)),
      ),
    );
  }
}
