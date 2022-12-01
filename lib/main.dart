import 'dart:async';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mas_flutter_template/src/app.dart';
import 'package:mas_flutter_template/src/providers/auth_provider.dart';
import 'package:mas_flutter_template/src/providers/preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await dotenv.load();

      final Preferences prefs = Preferences();
      await prefs.initPrefs();

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
      );

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      final PackageInfo info = await PackageInfo.fromPlatform();
      final ip = await Ipify.ipv64();

      // TODO Initialize external services (Firebase, Sentry, Analytics, etc)

      FlutterError.onError = (final FlutterErrorDetails details) async {
        // TODO Capture Error
      };

      initApp();
    },
    (final Object exception, final StackTrace stackTrace) async {
      // TODO Capture Exception
    },
  );
}

void initApp() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (final _) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
