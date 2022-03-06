import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  final keys = ["AMOUNT_VISIBILITY"];
  static final Preferences? _instance = Preferences._internal();
  Preferences._internal();

  late SharedPreferences _preferences;
  factory Preferences() => _instance!;

  initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  void setVisibilityAmount() =>
      _preferences.setBool(keys[0], !visibilityAmount);

  get visibilityAmount => _preferences.getBool(keys[0]) ?? true;
}
