import 'package:flutter/material.dart';

/// An easier to use [IconButton]
/// actions.
class CircularButton extends StatelessWidget {
  // ignore: public_member_api_docs
  final Widget icon;

  // ignore: public_member_api_docs
  final VoidCallback onPressed;

  /// The size of this icon.
  ///
  /// When not specified, defaults to `24.0`.
  final double size;

  /// The padding of this icon.
  ///
  /// When not specified, defaults to
  /// `EdgeInsets.all(8)`.
  final EdgeInsets padding;

  // ignore: public_member_api_docs
  final String? tooltip;

  /// Creates an easier to use [IconButton].
  const CircularButton({
    required this.icon,
    required this.onPressed,
    final Key? key,
    this.size = 24.0,
    this.padding = const EdgeInsets.all(8),
    this.tooltip,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    Widget button = Material(
      type: MaterialType.transparency,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Padding(
          padding: padding,
          child: icon,
        ),
      ),
    );

    if (tooltip != null) {
      button = Tooltip(
        message: tooltip ?? '',
        child: button,
      );
    }

    return button;
  }
}
