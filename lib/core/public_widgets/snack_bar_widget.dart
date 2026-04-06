import 'package:flutter/material.dart';

void showAppSnackBar(
  BuildContext context, {
  required String message,
  Color? backgroundColor,
  SnackBarBehavior behavior = SnackBarBehavior.fixed,
  ShapeBorder? shape,
  TextStyle? textStyle,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message, style: textStyle),
        backgroundColor: backgroundColor,
        behavior: behavior,
        shape: shape,
      ),
    );
}
