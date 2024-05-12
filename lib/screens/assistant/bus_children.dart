import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/screens/assistant/dashboard_assistant.dart';
import 'package:raqip_app/screens/assistant/incident.dart';
import 'package:raqip_app/screens/assistant/routes.dart';
import 'package:raqip_app/screens/components/NavigationItem.dart';

class BusChildren extends StatefulWidget {
  const BusChildren({super.key, required this.route});
  final dynamic route;
  @override
  State<BusChildren> createState() => _BusChildrenState();
}

class _BusChildrenState extends State<BusChildren> {
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
                  isActive: false,
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
                  label: "Incident",
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
                  isActive: true,
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
        appBar: AppBar(
          title: const Text(
            "Children",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: secondColor,
          iconTheme: IconThemeData(color: mainColor),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            color: secondColor,
            width: MediaQuery.of(context).size.width,
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                ...List.generate(
                  10,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.asset(
                              "assets/images/child-2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Elmahdi bellaziz",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(
                                "av 4,chabaa",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF8D8989)),
                              ),
                              Text(
                                "4eme annee primaire",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF8D8989)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
