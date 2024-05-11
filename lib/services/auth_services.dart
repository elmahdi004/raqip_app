import 'dart:convert';

import 'package:raqip_app/constant.dart';
import 'package:raqip_app/models/api_response.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> login(String? email, String? password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse('$api/login'),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 404:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWrong;
    }
  } catch (e) {
    print("we have a error");
  }
  return apiResponse;
}

Future<ApiResponse> logoutAsParent() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    await http.get(Uri.parse('$api/logout/parent'),
        headers: {'Accept': 'application/json'});
  } catch (e) {
    apiResponse.error = somethingWrong;
  }
  return apiResponse;
}
Future<ApiResponse> logoutAsAssistant() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    await http.get(Uri.parse('$api/logout/assistant'),
        headers: {'Accept': 'application/json'});
  } catch (e) {
    apiResponse.error = somethingWrong;
  }
  return apiResponse;
}
