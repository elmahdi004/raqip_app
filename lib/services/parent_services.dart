import 'dart:convert';

import 'package:raqip_app/constant.dart';
import 'package:raqip_app/models/api_response.dart';
import 'package:raqip_app/state.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> getChildren() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
        Uri.parse('$api/parent/${authParent?.id}/children'),
        headers: {'Accept': 'application/json'});
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 404:
        apiResponse.error = somethingWrong;
    }
  } catch (e) {
    apiResponse.error = somethingWrong;
  }
  return apiResponse;
}
