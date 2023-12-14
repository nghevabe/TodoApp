import 'package:flutter/material.dart';

class CustomDialog {
  show(BuildContext context,
      {Widget? content, String? btnText, Function()? onTap}) {
    return showDialog(
        context: context,
        // barrierDismissible: dismissible ?? true,
        builder: (context) {
          return content ?? Container();
        });
  }
}
