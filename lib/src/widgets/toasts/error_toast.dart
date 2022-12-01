import 'package:flutter/material.dart';

class ErrorToast extends StatelessWidget {
  const ErrorToast({
    required this.label,
    final Key? key,
  }) : super(key: key);

  final String label;

  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        color: Colors.red[800],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.close, color: Colors.white),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: size.width * 0.65,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
