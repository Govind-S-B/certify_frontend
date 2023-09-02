import 'package:certify_frontend/app_theme.dart';
import 'package:flutter/material.dart';

class NotFinalizedWidget extends StatelessWidget {
  const NotFinalizedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppTheme.darkYellow,
      ),
      width: 50,
      height: 25,
      child: Center(
        child: Text(
          "Not Finalized",
          style: TextStyles.body()
              .copyWith(color: AppTheme.yellow, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
