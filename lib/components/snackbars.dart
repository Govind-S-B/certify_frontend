import 'package:certify_frontend/app_theme.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void green(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: 350, // Maximum width of the Snackbar
        content: Text(
          message,
          style: TextStyles.body()
              .copyWith(color: AppTheme.darkGreen, fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppTheme.green,
      ),
    );
  }

  static void yellow(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: 350, // Maximum width of the Snackbar
        content: Text(
          message,
          style: TextStyles.body().copyWith(
              color: AppTheme.darkYellow, fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppTheme.yellow,
      ),
    );
  }

  static void red(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: 350, // Maximum width of the Snackbar
        content: Text(
          message,
          style: TextStyles.body()
              .copyWith(color: AppTheme.darkRed, fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppTheme.red,
      ),
    );
  }
}
