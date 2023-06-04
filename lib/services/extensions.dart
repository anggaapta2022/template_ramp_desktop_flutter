import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  double get height {
    return MediaQuery.of(this).size.height;
  }

  double get width {
    return MediaQuery.of(this).size.width;
  }

  double? get textscale {
    return MediaQuery.of(this).textScaleFactor > 0.9 ? 0.9 : null;
  }

  Future<dynamic> pop([bool? result]) async {
    return Navigator.of(this).pop(result);
  }

  Future<dynamic> push(Widget widget) async {
    return Navigator.of(this)
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  Future<dynamic> pushAndRemoveUntil(Widget widget) async {
    return Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }

  Future<dynamic> snackBar(Color colorBackground, Color colorIcon, String title,
      IconData icon) async {
    return ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        backgroundColor: colorBackground,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(this).size.height - 100, right: 24, left: 24),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textScaleFactor:
                  MediaQuery.of(this).textScaleFactor > 0.9 ? 0.9 : null,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: colorIcon,
            )
          ],
        )));
  }
}
