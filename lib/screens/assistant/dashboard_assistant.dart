import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/screens/assistant/assistant_profile.dart';
import 'package:raqip_app/screens/assistant/bus_children.dart';
import 'package:raqip_app/screens/assistant/incident.dart';
import 'package:raqip_app/screens/assistant/map.dart';
import 'package:raqip_app/screens/assistant/routes.dart';
import 'package:raqip_app/screens/components/NavigationItem.dart';
import 'package:raqip_app/screens/notification.dart';
import 'package:raqip_app/state.dart';

class DashboardAssistant extends StatefulWidget {
  const DashboardAssistant({super.key, required this.route});
  final dynamic route;
  @override
  State<DashboardAssistant> createState() => _DashboardAssistanrState();
}

class _DashboardAssistanrState extends State<DashboardAssistant> {
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
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 180,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
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
                              child: const Icon(Icons.watch),
                            ),
                            const Text(
                              "11:30",
                              style: TextStyle(
                                  color: Color(0xFF8D8989), fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Text(
                              "temps restant",
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
                          "maps",
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
                              child: const Icon(Icons.watch),
                            ),
                            const Text(
                              "11:30",
                              style: TextStyle(
                                  color: Color(0xFF8D8989), fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Text(
                              "temps restant",
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
                          "maps",
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
