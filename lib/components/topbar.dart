import 'package:certify_frontend/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Certify",
            style: TextStyles.h3()
                .copyWith(color: AppTheme.white, fontWeight: FontWeight.w600),
          ),
          Expanded(child: Container()),
          IconButton(
            iconSize: 35,
            onPressed: () async {
              var _url = Uri.parse("https://github.com/Govind-S-B/Certify");

              if (!await launchUrl(_url)) {
                throw Exception('Could not launch $_url');
              }
            },
            icon: Image.asset(
              "assets/images/github.png",
              color: AppTheme.white,
            ),
          )
        ],
      ),
    );
  }
}
