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
      width: 125,
      height: 25,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "Not Finalized",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyles.body()
                .copyWith(color: AppTheme.yellow, fontWeight: FontWeight.w600)
          ),
        ),
      ),
    );
  }
}
