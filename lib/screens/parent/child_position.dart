import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:raqip_app/constant.dart';

class ChildPosition extends StatefulWidget {
  const ChildPosition({super.key});

  @override
  State<ChildPosition> createState() => _ChildPositionState();
}

class _ChildPositionState extends State<ChildPosition> {
  int activeTab = 0;
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 90,
                color: secondColor,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(32.307529, -9.216125),
                    initialZoom: 17,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=$mapboxApiKey',
                      userAgentPackageName: 'com.example.app',
                    ),
                    // PolylineLayer(polylines: [
                    //   Polyline(
                    //     points: routePoints,
                    //     strokeWidth: 8.0, // Line width
                    //     color: Colors.blue,
                    //   )
                    // ]),
                  ],
                ),
              ),
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
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  // color: Colors.red,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(60)),
                                          child: const Center(
                                              child: Icon(
                                            Icons.school,
                                            color: Colors.white,
                                          )),
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          "12:54",
                                          style: TextStyle(
                                              color: myTextColor, fontSize: 17),
                                        ),
                                        const SizedBox(width: 25),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Pick up from school",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                                "345 Haledon Ave,New Jersey 07508",
                                                style: TextStyle(
                                                    color: myTextColor)),
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
                                  decoration: DottedDecoration(
                                      color: mainColor,
                                      strokeWidth: 3,
                                      linePosition: LinePosition.right,
                                      dash: const [10]),
                                  height: 100,
                                  width: 25,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  // color: Colors.red,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(60)),
                                          child: const Center(
                                              child: Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          )),
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          "12:54",
                                          style: TextStyle(
                                              color: myTextColor, fontSize: 17),
                                        ),
                                        const SizedBox(width: 25),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Pick up from school",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                                "345 Haledon Ave,New Jersey 07508",
                                                style: TextStyle(
                                                    color: myTextColor)),
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
                                  decoration: DottedDecoration(
                                      color: mainColor,
                                      strokeWidth: 3,
                                      linePosition: LinePosition.right,
                                      dash: const [10]),
                                  height: 100,
                                  width: 25,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  // color: Colors.red,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(60)),
                                          child: const Center(
                                              child: Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          )),
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          "12:54",
                                          style: TextStyle(
                                              color: myTextColor, fontSize: 17),
                                        ),
                                        const SizedBox(width: 25),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Pick up from school",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                                "345 Haledon Ave,New Jersey 07508",
                                                style: TextStyle(
                                                    color: myTextColor)),
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
                            margin: const EdgeInsets.symmetric(horizontal: 20),
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
        ));
  }
}

class BottomSheetDummyUI extends StatelessWidget {
  const BottomSheetDummyUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      color: Colors.black12,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          color: Colors.black12,
                          height: 20,
                          width: 240,
                        ),
                      ),
                      SizedBox(height: 5),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          color: Colors.black12,
                          height: 20,
                          width: 180,
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
            ],
          )),
    );
  }
}

class MyDraggableSheet extends StatefulWidget {
  final Widget child;
  const MyDraggableSheet({super.key, required this.child});

  @override
  State<MyDraggableSheet> createState() => _MyDraggableSheetState();
}

class _MyDraggableSheetState extends State<MyDraggableSheet> {
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    controller.addListener(onChanged);
  }

  void onChanged() {
    final currentSize = controller.size;
    if (currentSize <= 0.05) collapse();
  }

  void collapse() => animateSheet(getSheet.snapSizes!.first);

  void anchor() => animateSheet(getSheet.snapSizes!.last);

  void expand() => animateSheet(getSheet.maxChildSize);

  void hide() => animateSheet(getSheet.minChildSize);

  void animateSheet(double size) {
    controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  DraggableScrollableSheet get getSheet =>
      (sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DraggableScrollableSheet(
        key: sheet,
        initialChildSize: 0.5,
        maxChildSize: 0.95,
        minChildSize: 0,
        expand: true,
        snap: true,
        snapSizes: [
          60 / constraints.maxHeight,
          0.5,
        ],
        controller: controller,
        builder: (BuildContext context, ScrollController scrollController) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                topButtonIndicator(),
                SliverToBoxAdapter(
                  child: widget.child,
                ),
              ],
            ),
          );
        },
      );
    });
  }

  SliverToBoxAdapter topButtonIndicator() {
    return SliverToBoxAdapter(
      child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Container(
                child: Center(
                    child: Wrap(children: <Widget>[
              Container(
                  width: 100,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  )),
            ]))),
          ])),
    );
  }
}
