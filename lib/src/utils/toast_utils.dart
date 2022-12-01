import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:mas_flutter_template/src/widgets/toasts/error_toast.dart';
import 'package:mas_flutter_template/src/widgets/toasts/success_toast.dart';

showErrorToast({
  required final BuildContext context,
  final String label = 'ERROR',
}) {
  showToastWidget(
    ErrorToast(
      label: label,
    ),
    dismissOtherToast: true,
    context: context,
    animation: StyledToastAnimation.slideFromRight,
    reverseAnimation: StyledToastAnimation.fade,
    position: const StyledToastPosition(
      align: Alignment(0, -0.85),
    ),
  );
}

showSuccessToast({
  required final BuildContext context,
  final String label = 'SUCCESS',
}) {
  showToastWidget(
    SuccessToast(label: label),
    dismissOtherToast: true,
    context: context,
    animation: StyledToastAnimation.slideFromRight,
    reverseAnimation: StyledToastAnimation.fade,
    position: const StyledToastPosition(
      align: Alignment(0, -0.85),
    ),
  );
}
