import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: APISettings(),
    );
  }
}

class APISettings extends StatelessWidget {
  const APISettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: Column(children: [Text("API Settings")]),
    );
  }
}
