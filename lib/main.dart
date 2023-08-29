import 'package:certify_frontend/components/sidebar.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Certify',
      theme: AppTheme.darkTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Row(children: [
          CustomSideBar(),
          Expanded(child: Container()),
        ]),
      ),
    ));
  }
}
