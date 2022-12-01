import 'package:flutter/material.dart';
import 'package:mas_flutter_template/src/widgets/dialogs/alert_widget.dart';
import 'package:mas_flutter_template/src/widgets/dialogs/confirm_widget.dart';

showConfirmWidget({
  required final BuildContext context,
  required final String title,
  required final String message,
  required final VoidCallback accept,
}) {
  showDialog(
    context: context,
    builder: (final context) => ConfirmWidget(
      title: title,
      message: message,
      accept: accept,
    ),
  );
}

showAlertWidget({
  required final BuildContext context,
  required final String title,
  required final String message,
}) {
  showDialog(
    context: context,
    builder: (final _) => AlertWidget(
      title: title,
      message: message,
    ),
  );
}
