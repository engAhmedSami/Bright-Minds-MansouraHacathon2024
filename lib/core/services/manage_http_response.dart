import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_bright_minds/core/helper/failuer_top_snak_bar.dart';

void manageHttpResponse({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200 || 201:
      onSuccess();
      break;
    case 400 || 401 || 403:
      failuerTopSnackBar(context, json.decode(response.body)['message']);
      break;
    case 500:
      failuerTopSnackBar(context, json.decode(response.body)['error']);
      break;
  }
}
