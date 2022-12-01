import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  // Singleton.
  static final Preferences _instancia = Preferences._internal();

  factory Preferences() => _instancia;

  Preferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get token => _prefs.getString('token') ?? '';

  set token(final String value) {
    _prefs.setString('token', value);
  }

  int get userId => _prefs.getInt('userId') ?? -1;

  set userId(final int value) {
    _prefs.setInt('userId', value);
  }
}
