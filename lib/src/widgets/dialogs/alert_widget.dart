import 'package:flutter/material.dart';
import 'package:mas_flutter_template/src/widgets/buttons/circular_button.dart';

class AlertWidget extends StatefulWidget {
  final String title;
  final String message;

  const AlertWidget({
    required this.title,
    required this.message,
    final Key? key,
  }) : super(key: key);

  @override
  AlertWidgetState createState() => AlertWidgetState();
}

class AlertWidgetState extends State<AlertWidget> {
  @override
  Widget build(final BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CircularButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.title,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.message,
              style: const TextStyle(
                color: Color(0xff424242),
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      );
}
