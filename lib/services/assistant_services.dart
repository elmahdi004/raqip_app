import 'dart:convert';

import 'package:latlong2/latlong.dart';
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

Future<ApiResponse> updateVehicleLocation(LatLng location) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(
        Uri.parse('$api/vehicle/${authAssistant?.vehicle.id}/location'),
        headers: {
          'Accept': 'application/json'
        },
        body: {
          "latitude": location.latitude.toString(),
          "longitude": location.longitude.toString()
        });

    switch (response.statusCode) {
      case 200:
        print("============= Has Been Update ${authAssistant?.vehicle.id}");
        break;
      case 404:
        apiResponse.error = somethingWrong;
    }
  } catch (e) {
    print("---------------- $e");
    apiResponse.error = somethingWrong;
  }
  return apiResponse;
}

Future<ApiResponse> createOrUpdateVol(int routeId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(
      Uri.parse('$api/parent/$routeId/child/last-vol'),
      headers: {'Accept': 'application/json'},
    );

    switch (response.statusCode) {
      case 200:
        print("============= Has Been Update *2");
        break;
      case 404:
        apiResponse.error = somethingWrong;
    }
  } catch (e) {
    print("---------------- $e");
    apiResponse.error = somethingWrong;
  }
  return apiResponse;
}

Future<ApiResponse> createIncident(
    int routeId, String type, String description) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(
      Uri.parse(
          '$api/assistant/${authAssistant?.id}/route/$routeId/create-incident'),
      body: {
        "type": type,
        "description": description,
        "assistant_id": authAssistant?.id.toString(),
        "route_id": routeId.toString()
      },
      headers: {'Accept': 'application/json'},
    );

    switch (response.statusCode) {
      case 200:
        print("wa aloooooooooooooooooooooha");

        break;
      case 404:
        apiResponse.error = somethingWrong;
    }
  } catch (e) {
    print("wa errrrrrrrrrrrrrror  : $e");
    apiResponse.error = somethingWrong;
  }
  return apiResponse;
}
