import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mequi/Utils/preferences.dart';
import 'package:mequi/Utils/values/routes.dart';
import 'package:mequi/Utils/values/values.dart';

late Preferences preferences;
void main() async {
//ESPERAR QUE ALGO INICIALIZE POR EJEMPLO LAS PREFERENCIAS
  WidgetsFlutterBinding.ensureInitialized();

  preferences = Preferences();
  await preferences.initPreferences();

  runApp(MyApp());
}

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
      routes: routes,
      initialRoute: "/",
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(colorScaffold),
        iconTheme: IconThemeData(color: Color(colorPimary)),
      ),
    );
  }
}
