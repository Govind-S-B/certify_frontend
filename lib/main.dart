import 'package:certify_frontend/components/sidebar.dart';
import 'package:certify_frontend/components/topbar.dart';
import 'package:certify_frontend/home.dart';
import 'package:certify_frontend/settings.dart';
import 'package:certify_frontend/states/page_state.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PageState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        child: Column(
          children: [
            CustomTopBar(),
            Expanded(
              child: Row(children: [
                CustomSideBar(),
                Expanded(
                  child: Consumer<PageState>(
                    builder: (context, pageState, _) {
                      // Render the current page based on the state
                      switch (pageState.currentPageIndex) {
                        case 0:
                          return HomePage();
                        case 1:
                          return SettingsPage();
                        // Add cases for other pages
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
