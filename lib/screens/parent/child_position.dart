import 'dart:convert';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/models/api_response.dart';
import 'package:raqip_app/screens/parent/BottomSheetDummyUI.dart';
import 'package:raqip_app/services/parent_services.dart';
import 'package:http/http.dart' as http;

class ChildPosition extends StatefulWidget {
  const ChildPosition({super.key, required this.child});
  final dynamic child;
  @override
  State<ChildPosition> createState() => _ChildPositionState();
}

class _ChildPositionState extends State<ChildPosition> {
  List<LatLng> routePoints = [];

  int activeTab = 0;
  bool loading = false;
  bool mapLoading = true;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  dynamic child_status = {
    "id": null,
    "start_date": null,
    "end_date": null,
    "route_id": null,
    "created_at": null,
    "updated_at": null
  };
  String startDate = '';
  String endDate = '';
  LatLng center = const LatLng(0, 0);
  getMyChildStatusHandle() async {
    setState(() {
      loading = true;
    });
    ApiResponse response = await getMyChildStatus(widget.child["child_id"]);
    if (response.error == null) {
      child_status = response.data;
    }
    setState(() {
      loading = false;
    });
  }

  initializeState() async {
    await getMyChildStatusHandle();
    final DateFormat formatter = DateFormat('HH:mm');

    DateTime? startDateParsed = child_status["start_date"] != null
        ? DateTime.parse(child_status["start_date"])
        : null;

    DateTime? endDateParsed = child_status["end_date"] != null
        ? DateTime.parse(child_status["end_date"])
        : null;

    startDate =
        startDateParsed != null ? formatter.format(startDateParsed) : "";
    endDate = endDateParsed != null ? formatter.format(endDateParsed) : "";
  }

  Future<LatLng> getMyChildLocationHandle() async {
    ApiResponse apiResponse =
        await getMyChildLocation(widget.child["child_id"]);
    if (apiResponse.error == null) {
      dynamic data = apiResponse.data;
      fetchRoute(data);
      return center =
          LatLng(data["location"]["latitude"], data["location"]["longitude"]);
    }
    return center = LatLng(0, 0);
  }

  initializeMap() {
    getMyChildLocationHandle().then((location) {
      setState(() {
        center = location;
        mapLoading = false;
      });
    });
  }

  void fetchRoute(dynamic data) async {
    // Make HTTP request to Mapbox Directions API to get route geometry
    String apiUrl =
        'https://api.mapbox.com/directions/v5/mapbox/driving/${data["route"]['start_point_lng']},${data["route"]['start_point_lat']};${data["route"]['end_point_lng']},${data["route"]['end_point_lat']}?geometries=geojson&access_token=$mapboxApiKey';

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

  reloadPage() {
    initializeState();
    super.initState();
    initializeMap();
  }

  @override
  void initState() {
    reloadPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Localisation de mon enfant",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: secondColor,
          iconTheme: IconThemeData(color: mainColor),
        ),
        backgroundColor: Colors.black,
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () => reloadPage(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 90,
                    color: secondColor,
                    child: mapLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: mainColor,
                          ))
                        : FlutterMap(
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
                              MarkerLayer(markers: [
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
                              ]),
                              PolylineLayer(polylines: [
                                Polyline(
                                  points: routePoints,
                                  strokeWidth: 8.0, // Line width
                                  color: Colors.blue,
                                )
                              ]),
                            ],
                          )),
                Positioned(
                    child: Container(
                  child: MyDraggableSheet(
                      child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: activeTab == 0
                                    ? BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: mainColor, width: 2)))
                                    : const BoxDecoration(),
                                child: Text(
                                  "Histroy",
                                  style: TextStyle(
                                      color: myTextColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )),
                            Expanded(
                                child: GestureDetector(
                              child: Container(
                                decoration: activeTab == 1
                                    ? BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: mainColor, width: 2)))
                                    : const BoxDecoration(),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Bus info",
                                  style: TextStyle(
                                      color: myTextColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        // color: Colors.red,
                        child: PageView(
                          onPageChanged: (value) {
                            setState(() {
                              activeTab = value;
                            });
                          },
                          children: [
                            loading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: mainColor,
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          // color: Colors.red,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: child_status[
                                                              "end_date"] !=
                                                          null
                                                      ? BoxDecoration(
                                                          color: mainColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(60))
                                                      : BoxDecoration(
                                                          color: myTextColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60)),
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.school,
                                                    color: Colors.white,
                                                  )),
                                                ),
                                                const SizedBox(width: 15),
                                                SizedBox(
                                                  width: 45,
                                                  child: Text(
                                                    endDate,
                                                    style: TextStyle(
                                                        color: myTextColor,
                                                        fontSize: 17),
                                                  ),
                                                ),
                                                const SizedBox(width: 25),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Le bus arrive à l'école",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                        "345 Haledon Ave,New Jersey 07508",
                                                        style: TextStyle(
                                                            color:
                                                                myTextColor)),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          decoration:
                                              child_status["end_date"] != null
                                                  ? DottedDecoration(
                                                      color: mainColor,
                                                      strokeWidth: 3,
                                                      linePosition:
                                                          LinePosition.right,
                                                      dash: const [10])
                                                  : DottedDecoration(
                                                      color: myTextColor,
                                                      strokeWidth: 3,
                                                      linePosition:
                                                          LinePosition.right,
                                                      dash: const [10]),
                                          height: 100,
                                          width: 25,
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          // color: Colors.red,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: child_status[
                                                              "start_date"] !=
                                                          null
                                                      ? BoxDecoration(
                                                          color: mainColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(60))
                                                      : BoxDecoration(
                                                          color: myTextColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60)),
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.location_on,
                                                    color: Colors.white,
                                                  )),
                                                ),
                                                const SizedBox(width: 15),
                                                Text(
                                                  "",
                                                  style: TextStyle(
                                                      color: myTextColor,
                                                      fontSize: 17),
                                                ),
                                                const SizedBox(width: 65),
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Le bus est en mouvement",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          decoration:
                                              child_status["start_date"] != null
                                                  ? DottedDecoration(
                                                      color: mainColor,
                                                      strokeWidth: 3,
                                                      linePosition:
                                                          LinePosition.right,
                                                      dash: const [10])
                                                  : DottedDecoration(
                                                      color: myTextColor,
                                                      strokeWidth: 3,
                                                      linePosition:
                                                          LinePosition.right,
                                                      dash: const [10]),
                                          height: 100,
                                          width: 25,
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          // color: Colors.red,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: child_status[
                                                              "start_date"] !=
                                                          null
                                                      ? BoxDecoration(
                                                          color: mainColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(60))
                                                      : BoxDecoration(
                                                          color: myTextColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60)),
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.location_on,
                                                    color: Colors.white,
                                                  )),
                                                ),
                                                const SizedBox(width: 15),
                                                SizedBox(
                                                  width: 45,
                                                  child: Text(
                                                    startDate,
                                                    style: TextStyle(
                                                        color: myTextColor,
                                                        fontSize: 17),
                                                  ),
                                                ),
                                                const SizedBox(width: 25),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Départ du bus scolaire",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                        "345 Haledon Ave,New Jersey 07508",
                                                        style: TextStyle(
                                                            color:
                                                                myTextColor)),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: MediaQuery.of(context).size.width,
                              // height: 50,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xFFE4DCDC)))),
                                    // height: 40,
                                    // color: Colors.red,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xFFEBE5E5),
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: const Center(
                                            child: Icon(
                                              Icons.person_2_outlined,
                                              color: Color(0xFF8D8989),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Abdslam Lony",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold, // Style for the name
                                                      color: Colors.black,
                                                      fontSize:
                                                          20 // Color for the name
                                                      ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "(chauffeur)",
                                                  style: TextStyle(
                                                    fontStyle: FontStyle
                                                        .italic, // Style for the chauffeur
                                                    color: Colors
                                                        .grey, // Color for the chauffeur
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("On Bus"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xFFE4DCDC)))),
                                    // height: 40,
                                    // color: Colors.red,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xFFEBE5E5),
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: const Center(
                                            child: Icon(
                                              Icons.person_2_outlined,
                                              color: Color(0xFF8D8989),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Amel Soussi",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold, // Style for the name
                                                      color: Colors.black,
                                                      fontSize:
                                                          20 // Color for the name
                                                      ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "(assisstnate)",
                                                  style: TextStyle(
                                                    fontStyle: FontStyle
                                                        .italic, // Style for the chauffeur
                                                    color: Colors
                                                        .grey, // Color for the chauffeur
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text("On Bus"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xFFE4DCDC)))),
                                    // height: 40,
                                    // color: Colors.red,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xFFEBE5E5),
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: const Center(
                                            child: Icon(
                                              Icons.chair_alt,
                                              color: Color(0xFF8D8989),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Nombre disponible",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold, // Style for the name
                                                      color: Colors.black,
                                                      fontSize:
                                                          20 // Color for the name
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Text("55"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xFFE4DCDC)))),
                                    // height: 40,
                                    // color: Colors.red,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xFFEBE5E5),
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: const Center(
                                            child: Icon(
                                              Icons.settings,
                                              color: Color(0xFF8D8989),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Etat du vehicule",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold, // Style for the name
                                                      color: Colors.black,
                                                      fontSize:
                                                          20 // Color for the name
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Text("Moyenne"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xFFE4DCDC)))),
                                    // height: 40,
                                    // color: Colors.red,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xFFEBE5E5),
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: const Center(
                                            child: Icon(
                                              Icons.app_registration,
                                              color: Color(0xFF8D8989),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Matricule de vehicule",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold, // Style for the name
                                                      color: Colors.black,
                                                      fontSize:
                                                          20 // Color for the name
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Text("1234/PP/54"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
                ))
              ],
            ),
          ),
        ));
  }
}
