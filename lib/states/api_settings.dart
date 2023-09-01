import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiSettings extends ChangeNotifier {
  String _serverAddress = '';
  String _authKey = '';

  String get serverAddress => _serverAddress;
  String get authKey => _authKey;

  void loadSavedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _serverAddress = prefs.getString('serverAddress') ?? '';
    _authKey = prefs.getString('authKey') ?? '';
  }

  void saveValues(inputServerAddress, inputAuthKey) async {
    _serverAddress = inputServerAddress;
    _authKey = inputAuthKey;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('serverAddress', _serverAddress);
    await prefs.setString('authKey', _authKey);

    notifyListeners();
  }
}
