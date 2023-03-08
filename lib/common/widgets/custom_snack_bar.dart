import 'package:shipcret/material-theme/common_color.dart';

import 'package:flutter/material.dart';

class FCustomSnackBar {
  static fixedSnackBar(BuildContext context, String msg,
      {double height = 30, Color? fontColor, Color? backgroundColor}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: backgroundColor ?? FCommonColor.fixedSnackBar,
      content: Text(
        msg,
        style: TextStyle(
          color: fontColor ?? Colors.black87,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static floatingSnackBar(BuildContext context, String msg,
      {double height = 30, Color? fontColor, Color? backgroundColor, int? durationSec}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: backgroundColor ?? FCommonColor.floatingSnackBar,
      content: Text(
        msg,
        style: TextStyle(
          color: fontColor ?? Colors.black87,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      duration: Duration(seconds: durationSec ?? 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
