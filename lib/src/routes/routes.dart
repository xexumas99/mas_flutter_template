import 'package:flutter/material.dart';
import 'package:mas_flutter_template/src/pages/home_page.dart';
import 'package:mas_flutter_template/src/pages/profile_page.dart';

Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
      '/home': (final BuildContext context) => const HomePage(),
      '/profile': (final BuildContext context) => const ProfilePage(),

    };
