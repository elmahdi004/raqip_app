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

Future<ApiResponse> getMyChildStatus(int child_id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
      Uri.parse('$api/parent/$child_id/child/last-vol/child-status'),
      headers: {'Accept': 'application/json'},
    );
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

Future<ApiResponse> getMyChildLocation(int child_id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
      Uri.parse('$api/child/$child_id/get-my-child-location'),
      headers: {'Accept': 'application/json'},
    );

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

Future<ApiResponse> getMyNotifications() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
      Uri.parse('$api/parent/${authParent?.id}/get-my-notifications'),
      headers: {'Accept': 'application/json'},
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        print('--------------------- ${apiResponse.data}');
        break;
      case 404:
        apiResponse.error = somethingWrong;
    }
  } catch (e) {
    print('----------------- $e');
    apiResponse.error = somethingWrong;
  }
  return apiResponse;
}


Future<ApiResponse> getMyChildAssistant(child_id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
      Uri.parse('$api/child/$child_id/my-child-assistant'),
      headers: {'Accept': 'application/json'},
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        print('--------------------- ${apiResponse.data}');
        break;
      case 404:
        apiResponse.error = somethingWrong;
    }
  } catch (e) {
    print('----------------- $e');
    apiResponse.error = somethingWrong;
  }
  return apiResponse;
}
