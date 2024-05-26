import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/models/api_response.dart';
import 'package:raqip_app/screens/components/NavigationItem.dart';
import 'package:raqip_app/screens/notification.dart';
import 'package:raqip_app/screens/parent/child_position.dart';
import 'package:raqip_app/screens/parent/children.dart';
import 'package:raqip_app/screens/parent/profile.dart';
import 'package:raqip_app/services/parent_services.dart';
import 'package:raqip_app/state.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardParent extends StatefulWidget {
  const DashboardParent({super.key, required this.child});
  final dynamic child;
  @override
  State<DashboardParent> createState() => _DashboardParentState();
}

class _DashboardParentState extends State<DashboardParent> {
  dynamic child_status;
  bool loading = true;
  dynamic assistant = {"phone_number": ""};

  getMyChildStatusHandle() async {
    ApiResponse response = await getMyChildStatus(widget.child["child_id"]);
    if (response.error == null) {
      child_status = response.data;
    }
    setState(() {
      loading = false;
    });
  }

  String changeTimestampFormat(dynamic time) {
    final DateFormat formatter = DateFormat('HH:mm, dd MMM');

    DateTime? startDateParsed = time != null ? DateTime.parse(time) : null;

    return startDateParsed != null ? formatter.format(startDateParsed) : "";
  }

  void _makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  getMyChildAssistantHandle() async {
    ApiResponse response = await getMyChildAssistant(widget.child["child_id"]);
    if (response.error == null) {
      setState(() {
        assistant = response.data;
      });
    }
  }

  @override
  void initState() {
    getMyChildAssistantHandle();
    getMyChildStatusHandle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 70,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigationItem(
                  label: "Home",
                  icon: Icons.home,
                  isActive: true,
                  action: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) =>
                                DashboardParent(child: widget.child)),
                        (route) => false);
                  },
                ),
                NavigationItem(
                  label: "Search",
                  icon: Icons.search,
                  isActive: false,
                  action: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Children(
                              child: widget.child,
                            )));
                  },
                ),
                NavigationItem(
                  label: "Contact",
                  icon: Icons.comment,
                  isActive: false,
                  action: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ChildPosition(child: widget.child)));
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          leading: Container(
              width: 45,
              height: 45,
              margin: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.asset(
                    "assets/images/profile.png",
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          backgroundColor: secondColor,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationPage()));
                },
                icon: const Icon(
                  Icons.notifications_outlined,
                  size: 40,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: secondColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "Hi, ${authParent?.name ?? ""}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  Children(child: widget.child)),
                          (route) => false);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: mainColor, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: const Icon(Icons.baby_changing_station),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "mes enfants",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      _makePhoneCall(assistant["phone_number"]);
                      print(
                          "-------------------- ${assistant["phone_number"]}");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: mainColor, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: const Icon(Icons.phone_callback),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "appeler l’école",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Position actuel du véhicule ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "#12313/pp/45",
                                  // style: TextStyle(fontSize: 17),
                                ),
                                Container(
                                  height: 40,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/images/raQib-logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          child_status != null &&
                                  child_status["end_date"] == null
                              ? const Text(
                                  "En mouvement",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                )
                              : const Text(
                                  "Immobile",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Expanded(
                                    child: Container(
                                  height: 4,
                                  color: mainColor,
                                )),
                                child_status != null &&
                                        child_status["end_date"] == null
                                    ? Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: mainColor, width: 2),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: const Center(
                                          child: Icon(
                                            Icons.bus_alert_outlined,
                                            size: 15,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                child_status != null &&
                                        child_status["end_date"] == null
                                    ? Expanded(
                                        child: Container(
                                        height: 4,
                                        color: myTextColor,
                                      ))
                                    : Expanded(
                                        child: Container(
                                        height: 4,
                                        color: mainColor,
                                      )),
                                child_status != null &&
                                        child_status["end_date"] == null
                                    ? Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: myTextColor,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      )
                                    : Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (child_status != null)
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(changeTimestampFormat(
                                      child_status["start_date"])),
                                  Text(changeTimestampFormat(
                                      child_status["end_date"])),
                                ])
                        ],
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
