import 'dart:convert';

import 'package:certify_frontend/components/snackbars.dart';
import 'package:certify_frontend/states/api_settings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class EventsPaneState extends ChangeNotifier {
  var _jsonResponse = [];

  Map<String, dynamic> _queryparams = {};

  int _currentPageIndex = 0;
  int maxPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;
  List get jsonResponse => _jsonResponse;
  get queryparams => _queryparams;

  Future<void> fetchData(context) async {
    var url = Uri.parse("https://" +
        Provider.of<ApiSettings>(context, listen: false).serverAddress +
        "/event/list");
    final headers = {
      'API-Auth-Key': Provider.of<ApiSettings>(context, listen: false).authKey
    };

    url = url.replace(queryParameters: _queryparams);

    final response = await http.get(url, headers: headers);

    _jsonResponse = [];

    if (response.statusCode == 200) {
      // Request successful, parse the JSON response
      print(response.body);
      _jsonResponse = json.decode(response.body) as List;
      // Process the JSON data as needed
    } else {
      // Request failed, handle the error
      _jsonResponse = [];
      CustomSnackbar.red(context, "Couldnt Connect to API Server");
    }

    notifyListeners();
  }

  void searchEvents(context, searchterm) {
    if (searchterm.isNotEmpty) {
      _queryparams['search'] = searchterm;
      _currentPageIndex = 0;
    } else {
      _queryparams.remove('search');
      _currentPageIndex = 0;
    }

    fetchData(context);
  }

  void notFinalizedFilterModify(context) {
    if (!_queryparams.containsKey("not_finalized")) {
      // checks if it does not contain it
      _queryparams['not_finalized'] = "true";
      _currentPageIndex = 0;
    } else {
      _queryparams.remove('not_finalized');
      _currentPageIndex = 0;
    }

    fetchData(context);
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
