import 'package:flutter/material.dart';
import 'package:mas_flutter_template/src/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  bool _logged = false;
  User? _user;

  bool get logged => _logged;

  set logged(final bool i) {
    _logged = i;
    notifyListeners();
  }

  User? get user => _user;

  set user(final User? val) {
    _user = val;
    notifyListeners();
  }
}
