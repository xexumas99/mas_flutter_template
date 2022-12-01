import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mas_flutter_template/src/models/exceptions/main_exception.dart';
import 'package:mas_flutter_template/src/models/user_model.dart';
import 'package:mas_flutter_template/src/providers/auth_provider.dart';
import 'package:mas_flutter_template/src/providers/preferences.dart';
import 'package:mas_flutter_template/src/utils/device_utils.dart';
import 'package:mas_flutter_template/src/utils/overlay_utils.dart';
import 'package:provider/provider.dart';

class AuthService {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);

  Future<dynamic> login(
    final String email,
    final String password,
    final BuildContext context,
  ) async {
    dynamic data;
    final Preferences prefs = Preferences();

    final apiHost = dotenv.env['API_HOST'];

    final Uri url = Uri.parse('$apiHost/login');

    final body = jsonEncode({
      'email': email,
      'password': password,
      'deviceInfo': await deviceInfo,
    });

    setLoader(context, true);

    final response = await http.post(
      url,
      body: body,
      headers: {
        'Content-Type': 'application/json',
      },
    ).timeout(const Duration(seconds: 10));

    final status = response.statusCode;
    data = jsonDecode(response.body);

    if (status != 200) {
      setLoader(context, false);
      throw MainException(status: status, message: data['message']);
    }

    final User user = User.fromJson(data['user']);

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    authProvider.logged = true;
    authProvider.user = user;

    prefs.token = data['token'];
    prefs.userId = user.id;

    setLoader(context, false);

    return user;
  }

  Future<dynamic> loginWithToken(
    final String token,
    final int userId,
    final BuildContext context,
  ) async {
    dynamic data;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final apiHost = dotenv.env['API_HOST'];

    final Uri url = Uri.parse('$apiHost/api/auth/users/login-with-token');

    final body = jsonEncode({
      'id': userId,
      'token': token,
      'deviceInfo': await deviceInfo,
    });

    final response = await http.post(
      url,
      body: body,
      headers: {
        'Content-Type': 'application/json',
      },
    ).timeout(const Duration(seconds: 10));

    final status = response.statusCode;
    data = jsonDecode(response.body);

    if (status != 200) {
      final Preferences prefs = Preferences();

      authProvider.user = null;
      authProvider.logged = false;

      prefs.token = '';
      prefs.userId = -1;

      return;
    }

    final User user = User.fromJson(data['user']);

    authProvider.logged = true;
    authProvider.user = user;

    return user;
  }

  Future<dynamic> register(
    final String email,
    final String password,
    final BuildContext context,
  ) async {
    final Preferences prefs = Preferences();

    dynamic data;

    final apiHost = dotenv.env['API_HOST'];

    final Uri url = Uri.parse('$apiHost/api/auth/users/register');

    final body = jsonEncode({
      'email': email,
      'password': password,
      'deviceInfo': await deviceInfo,
    });

    setLoader(context, true);

    final response = await http.post(
      url,
      body: body,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    setLoader(context, false);

    final status = response.statusCode;
    data = jsonDecode(response.body);

    if (status != 201) {
      throw MainException(status: status, message: data['message']);
    }

    final User user = User.fromJson(data['user']);

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    authProvider.logged = true;
    authProvider.user = user;

    prefs.token = data['token'];
    prefs.userId = user.id;

    return User.fromJson(data['user']);
  }

  Future<void> logout(final BuildContext context) async {
    _disposeProviders(context);

    final Preferences prefs = Preferences();
    prefs.token = '';
    prefs.userId = -1;
  }

  void _disposeProviders(final BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    authProvider.user = null;
    authProvider.logged = false;
  }
}
