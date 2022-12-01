import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mas_flutter_template/src/config/router_config.dart';
import 'package:mas_flutter_template/src/providers/preferences.dart';
import 'package:mas_flutter_template/src/routes/routes.dart';
import 'package:mas_flutter_template/src/services/auth_services.dart';
import 'package:mas_flutter_template/src/styles/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Preferences prefs = Preferences();
    final String token = prefs.token;
    final int userId = prefs.userId;

    bool logged = false;

    if (token != '' && dotenv.get('APP_ENV') != 'serverless') {
      AuthService().loginWithToken(token, userId, context);
      logged = true;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: dotenv.get('APP_ENV') == 'prod',
      title: 'Mas Flutter Template',
      routes: routes,
      initialRoute: logged ? '/profile' : '/home',
      theme: themeData,
      navigatorKey: navigatorKey,
    );
  }
}
