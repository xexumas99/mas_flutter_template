import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainLoaderWidget extends StatefulWidget {
  const MainLoaderWidget({final Key? key}) : super(key: key);

  @override
  MainLoaderWidgetState createState() => MainLoaderWidgetState();
}

class MainLoaderWidgetState extends State<MainLoaderWidget> {
  @override
  Widget build(final BuildContext context) => SpinKitCubeGrid(
        color: Theme.of(context).primaryColor,
      );
}
