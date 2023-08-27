import 'package:flutter/material.dart';
import 'app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Heading 1',
              style: TextStyles.h1().copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
            Text(
              'Heading 2',
              style: TextStyles.h2().copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            Text(
              'Heading 3',
              style: TextStyles.h3().copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.green,
              ),
            ),
            Text(
              'Body text',
              style: TextStyles.body().copyWith(
                fontWeight: FontWeight.w100,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
