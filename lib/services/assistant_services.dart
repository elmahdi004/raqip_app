import 'dart:convert';

import 'package:raqip_app/constant.dart';
import 'package:raqip_app/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:raqip_app/state.dart';

Future<ApiResponse> getRoutes() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
        Uri.parse('$api/vehicle/${authAssistant?.vehicle.id}/get-routes'),
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

Future<ApiResponse> getRouteChildren(int id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(Uri.parse('$api/route/$id/children'),
        headers: {'Accept': 'application/json'});
    switch (response.statusCode) {
      case 200:
        print("i go them");
                print(jsonDecode(response.body));

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
