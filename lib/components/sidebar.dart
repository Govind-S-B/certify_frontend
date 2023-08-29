import 'dart:ui';
import 'package:certify_frontend/components/button.dart';
import 'package:flutter/material.dart';
import 'package:certify_frontend/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomSideBar extends StatelessWidget {
  const CustomSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppTheme.grey1),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CustomIconButton(
              onPressed: () {},
              iconData: Icons.home_filled,
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CustomIconButton(
              onPressed: () {
                _showDialog(context);
              },
              iconData: Icons.info,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CustomIconButton(
              onPressed: () {},
              iconData: Icons.settings,
            ),
          ),
        ]),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          content: Container(
            width: 400,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Certify",
                          style: TextStyles.h1().copyWith(
                              color: AppTheme.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          " v0.1.0",
                          style: TextStyles.body().copyWith(
                              color: AppTheme.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      iconSize: 50,
                      onPressed: () async {
                        var _url =
                            Uri.parse("https://github.com/Govind-S-B/Certify");

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
                SizedBox(
                  height: 30,
                ),
                Text("made with ♡ by"),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppTheme.grey2)),
                          onPressed: () async {
                            var _url =
                                Uri.parse("https://github.com/Govind-S-B");

                            if (!await launchUrl(_url)) {
                              throw Exception('Could not launch $_url');
                            }
                          },
                          child: Text(
                            "Govind",
                            style: TextStyles.body()
                                .copyWith(fontWeight: FontWeight.w600),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppTheme.grey2)),
                          onPressed: () async {
                            var _url = Uri.parse("https://github.com/sibycr18");

                            if (!await launchUrl(_url)) {
                              throw Exception('Could not launch $_url');
                            }
                          },
                          child: Text(
                            "Siby",
                            style: TextStyles.body()
                                .copyWith(fontWeight: FontWeight.w600),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  final Widget content;

  const CustomAlertDialog({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          backgroundColor: AppTheme.grey1,
          content: content,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
