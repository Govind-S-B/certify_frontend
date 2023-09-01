import 'package:certify_frontend/app_theme.dart';
import 'package:certify_frontend/states/api_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Settings",
                style: TextStyles.h1().copyWith(
                    color: AppTheme.white, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ApiSettingsSection(),
          ),
        ],
      ),
    );
  }
}

class ApiSettingsSection extends StatelessWidget {
  final TextEditingController serverAddressController = TextEditingController();
  final TextEditingController authKeyController = TextEditingController();

  ApiSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<ApiSettings>().serverAddress != '') {
      serverAddressController.text = context.watch<ApiSettings>().serverAddress;
    } else {
      serverAddressController.clear();
    }

    if (context.watch<ApiSettings>().authKey != '') {
      authKeyController.text = context.watch<ApiSettings>().authKey;
    } else {
      authKeyController.clear();
    }

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppTheme.grey1),
      height: 205,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Text("API Settings",
                  style: TextStyles.h3().copyWith(
                      color: AppTheme.white, fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: SizedBox(
                height: 30,
                child: TextField(
                  controller: serverAddressController,
                  decoration: InputDecoration(
                    labelText: 'API Server Address',
                    filled: true,
                    fillColor: AppTheme.grey2,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    labelStyle: TextStyles.body().copyWith(
                        color: AppTheme.grey4, fontWeight: FontWeight.w500),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: SizedBox(
                height: 30,
                child: TextField(
                  controller: authKeyController,
                  decoration: InputDecoration(
                    labelText: 'API Auth Key',
                    filled: true,
                    fillColor: AppTheme.grey2,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    labelStyle: TextStyles.body().copyWith(
                        color: AppTheme.grey4, fontWeight: FontWeight.w500),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      ApiSettings apiSettings =
                          Provider.of<ApiSettings>(context, listen: false);

                      var _serverAddress = serverAddressController.text;
                      var _authKey = authKeyController.text;
                      apiSettings.saveValues(_serverAddress, _authKey);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Values saved locally')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme
                          .green, // Set the background color to light green
                    ),
                    child: Text(
                      'Save',
                      style: TextStyles.body().copyWith(
                          color: AppTheme.darkGreen,
                          fontWeight: FontWeight
                              .w600 // Set the text color to dark green
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
