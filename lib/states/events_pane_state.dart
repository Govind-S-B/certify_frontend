import 'dart:convert';

import 'package:certify_frontend/components/snackbars.dart';
import 'package:certify_frontend/states/api_settings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class EventsPaneState extends ChangeNotifier {
  var _jsonResponse = [];

  int _currentPageIndex = 0;
  int maxPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;
  List get jsonResponse => _jsonResponse;

  Future<void> fetchData(context) async {
    final url = Uri.parse("https://" +
        Provider.of<ApiSettings>(context, listen: false).serverAddress +
        "/event/list");
    final headers = {
      'API-Auth-Key': Provider.of<ApiSettings>(context, listen: false).authKey
    };

    final response = await http.get(url, headers: headers);

    _jsonResponse = [];

    if (response.statusCode == 200) {
      // Request successful, parse the JSON response
      print(response.body);
      _jsonResponse = json.decode(response.body) as List;
      // Process the JSON data as needed
      print(_jsonResponse);
    } else {
      // Request failed, handle the error
      _jsonResponse = [];
      CustomSnackbar.red(context, "Couldnt Connect to API Server");
    }

    notifyListeners();
  }

  void NextPage() {
    if (_currentPageIndex < maxPageIndex) {
      _currentPageIndex += 1;
    }
    notifyListeners();
  }

  void LastPage() {
    _currentPageIndex = maxPageIndex;
    notifyListeners();
  }

  void PrevPage() {
    if (_currentPageIndex > 0) {
      _currentPageIndex -= 1;
    }
    notifyListeners();
  }

  void FirstPage() {
    _currentPageIndex = 0;
    notifyListeners();
  }
}
