import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart';
import 'package:raqip_app/constant.dart';
import 'package:geolocator/geolocator.dart';
import 'package:raqip_app/services/assistant_services.dart';

class AssistantMap extends StatefulWidget {
  const AssistantMap({super.key, required this.route});
  final dynamic route;
  @override
  State<AssistantMap> createState() => _MapState();
}

class _MapState extends State<AssistantMap> {
  LatLng startPoint = const LatLng(32.307529, -9.216125);
  LatLng endPoint = const LatLng(32.307529, -9.316125);
  LatLng center = const LatLng(0, 0);
  List<LatLng> routePoints = [];
  bool loading = false;
  bool suivi = false;

  Timer? _timer;

  void _startLocationUpdates() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      _determinePosition().then((LatLng currentPosition) {
        print(" I am Work Now");
        updateVehicleLocation(currentPosition);
        setState(() {
          center = currentPosition;
        });
      }).catchError((error) {
        print('Error getting current position: $error');
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<LatLng> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    return center = LatLng(position.latitude, position.longitude);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });

    _determinePosition().then((LatLng currentPosition) {
      setState(() {
        fetchRoute();
        loading = false;
      });
    }).catchError((error) {
      print('Error getting current position: $error');
      setState(() {
        loading = false;
      });
    });
  }

  void fetchRoute() async {
    // Make HTTP request to Mapbox Directions API to get route geometry
    String apiUrl =
        'https://api.mapbox.com/directions/v5/mapbox/driving/${widget.route['start_point_lng']},${widget.route['start_point_lat']};${widget.route['end_point_lng']},${widget.route['end_point_lat']}?geometries=geojson&access_token=$mapboxApiKey';

    try {
      Response response = await http.get(Uri.parse(apiUrl));
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> routes = data['routes'];
      if (routes.isNotEmpty) {
        List<dynamic> geometry = routes[0]['geometry']['coordinates'];
        setState(() {
          routePoints = geometry
              .map((coord) => LatLng(coord[1] as double, coord[0] as double))
              .toList();
        });
      }
    } catch (e) {
      print('========  Error fetching route: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        iconTheme: IconThemeData(color: mainColor),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: secondColor,
              ),
            )
          : Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    initialCenter: center,
                    initialZoom: 17,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=$mapboxApiKey',
                      userAgentPackageName: 'com.example.app',
                    ),
                    PolylineLayer(polylines: [
                      Polyline(
                        points: routePoints,
                        strokeWidth: 8.0, // Line width
                        color: Colors.blue,
                      )
                    ]),
                    MarkerLayer(markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(
                            widget.route['start_point_lat'],
                            widget.route[
                                'start_point_lng']), // Specify the LatLng for the marker position
                        child: const Icon(
                          Icons.location_pin,
                          color: Colors.red, // Marker color
                          size: 40.0,
                        ),
                      ),
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: center,
                        child: const Icon(
                          Icons.location_pin,
                          color: Colors.red, // Marker color
                          size: 40.0,
                        ),
                      )
                    ])
                  ],
                ),
                Positioned(
                    bottom: 30,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "mettre a jour",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "mettre a jour la postion du bus ",
                                    style: TextStyle(
                                        color: myTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  suivi
                                      ? Container(
                                          width: 300,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: mainColor,
                                          ),
                                          child: MaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                suivi = false;
                                                createOrUpdateVol(
                                                    widget.route["id"]);

                                                _timer?.cancel();
                                              });
                                            },
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "STOP",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: 300,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: mainColor,
                                          ),
                                          child: MaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                suivi = true;
                                                createOrUpdateVol(
                                                    widget.route["id"]);

                                                _startLocationUpdates();
                                              });
                                            },
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Icon(
                                                  Icons.send,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  "Commencer le suivi",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            )
                          ]),
                    ))
              ],
            ),
    );
  }
}
