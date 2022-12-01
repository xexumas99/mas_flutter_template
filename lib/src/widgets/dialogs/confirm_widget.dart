import 'package:flutter/material.dart';

class ConfirmWidget extends StatefulWidget {
  final String title;
  final String message;
  final VoidCallback accept;

  const ConfirmWidget({
    required this.title,
    required this.message,
    required this.accept,
    final Key? key,
  }) : super(key: key);

  @override
  ConfirmWidgetState createState() => ConfirmWidgetState();
}

class ConfirmWidgetState extends State<ConfirmWidget> {
  @override
  Widget build(final BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        content: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        foregroundColor: Theme.of(context).primaryColor,
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: const Text('No'),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: widget.accept,
                      child: const Text('Yes'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      );
}
