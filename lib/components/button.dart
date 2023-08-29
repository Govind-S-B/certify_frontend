import 'package:certify_frontend/app_theme.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  const CustomIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppTheme.pBlack),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.zero), // Remove default padding
        ),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
