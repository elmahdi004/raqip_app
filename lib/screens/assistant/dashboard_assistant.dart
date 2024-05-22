import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/models/api_response.dart';
import 'package:raqip_app/screens/assistant/assistant_profile.dart';
import 'package:raqip_app/screens/assistant/bus_children.dart';
import 'package:raqip_app/screens/assistant/incident.dart';
import 'package:raqip_app/screens/assistant/map.dart';
import 'package:raqip_app/screens/assistant/routes.dart';
import 'package:raqip_app/screens/components/NavigationItem.dart';
import 'package:raqip_app/services/assistant_services.dart';
import 'package:raqip_app/state.dart';

class DashboardAssistant extends StatefulWidget {
  const DashboardAssistant({super.key, required this.route});
  final dynamic route;
  @override
  State<DashboardAssistant> createState() => _DashboardAssistanrState();
}

class _DashboardAssistanrState extends State<DashboardAssistant> {
  dynamic child_status;
  bool loading = true;
  String changeTimestampFormat(dynamic time) {
    final DateFormat formatter = DateFormat('HH:mm, dd MMM');

    DateTime? startDateParsed = time != null ? DateTime.parse(time) : null;

    return startDateParsed != null ? formatter.format(startDateParsed) : "";
  }

  getMyChildStatusHandle() async {
    ApiResponse response = await getLastSuivi(widget.route["id"]);
    if (response.error == null) {
      child_status = response.data;
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getMyChildStatusHandle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AssistantProfile(
                          route: widget.route,
                        )));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.asset(
                  "assets/images/assistant.png",
                  fit: BoxFit.cover,
                ),
              ),
            )),
        iconTheme: IconThemeData(color: mainColor),
        // title: const Text(
        //   "Profile",
        //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        // ),
        centerTitle: true,
        backgroundColor: secondColor,
      ),
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
                              DashboardAssistant(route: widget.route)),
                      (route) => false);
                },
              ),
              NavigationItem(
                label: "Search",
                icon: Icons.search,
                isActive: false,
                action: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => Routes(
                                route: widget.route,
                              )),
                      (route) => false);
                },
              ),
              NavigationItem(
                label: "Contact",
                icon: Icons.comment,
                isActive: false,
                action: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => Incident(
                                route: widget.route,
                              )),
                      (route) => false);
                },
              ),
              NavigationItem(
                label: "Children",
                icon: Icons.supervised_user_circle_outlined,
                isActive: false,
                action: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => BusChildren(
                                route: widget.route,
                              )),
                      (route) => false);
                },
              ),
            ],
          ),
        ),
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
              "Hi, ${authAssistant?.name ?? ""}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
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
                              const Text(
                                "le dernier suivi",
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
                        child_status != null && child_status["end_date"] == null
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Incident(route: widget.route)));
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50))),
                              child: const Icon(Icons.report),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Text(
                              "signaler",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                          ],
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AssistantMap(
                              route: widget.route,
                            )));
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                          child: const Icon(Icons.map),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "suivi",
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
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => Routes(route: widget.route)),
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                          child: const Icon(Icons.map),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "routes",
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
          ],
        ),
      ),
    );
  }
}
