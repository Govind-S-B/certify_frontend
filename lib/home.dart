import 'package:certify_frontend/app_theme.dart';
import 'package:certify_frontend/dashboard/lpane_events.dart';
import 'package:certify_frontend/states/dashboard_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
            child: Consumer<LeftPaneState>(
              builder: (context, pageState, _) {
                // Render the current page based on the state
                switch (pageState.currentPageIndex) {
                  case 0:
                    return EventsPane();
                  case 1:
                  // return SettingsPage();
                  // Add cases for other pages
                  default:
                    return Container();
                }
              },
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child:

                // right pane handling switch case builder logic

                Container(
              color: AppTheme.green,
            ),
          ))
        ],
      ),
    );
  }
}
