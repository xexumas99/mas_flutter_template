import 'package:flutter/material.dart';
import 'package:mas_flutter_template/src/widgets/loaders/main_loader.dart';

late OverlayEntry overlayEntry;

_showOverlay(final BuildContext context, final Widget overlay) {
  final OverlayState overlayState = Overlay.of(context) as OverlayState;

  overlayEntry = OverlayEntry(
    builder: (final context) => overlay,
  );

  overlayState.insert(overlayEntry);
}

_showLoadingOverlay(final BuildContext context) {
  final Widget overlay = Container(
    height: double.infinity,
    width: double.infinity,
    color: Theme.of(context).primaryColor.withOpacity(0.3),
    child: const Center(
      child: MainLoaderWidget(),
    ),
  );
  _showOverlay(context, overlay);
}

_removeOverlay() {
  overlayEntry.remove();
}

setLoader(final BuildContext context, final bool newLoading) {
  if (newLoading) {
    _showLoadingOverlay(context);
  } else {
    _removeOverlay();
  }
}
