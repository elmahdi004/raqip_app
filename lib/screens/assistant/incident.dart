import 'package:flutter/material.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/screens/assistant/bus_children.dart';
import 'package:raqip_app/screens/assistant/custom_incident.dart';
import 'package:raqip_app/screens/assistant/dashboard_assistant.dart';
import 'package:raqip_app/screens/assistant/routes.dart';
import 'package:raqip_app/screens/components/NavigationItem.dart';

class Incident extends StatefulWidget {
  const Incident({super.key, required this.route});
  final dynamic route;
  @override
  State<Incident> createState() => _IncidentState();
}

class _IncidentState extends State<Incident> {
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
                      MaterialPageRoute(builder: (context) =>  Routes(route: widget.route,)),
                      (route) => false);
                },
              ),
              NavigationItem(
                label: "Incident",
                icon: Icons.comment,
                isActive: true,
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
      appBar: AppBar(
        title: const Text(
          "Incident",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: mainColor),
        backgroundColor: secondColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: secondColor,
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.warning_amber_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Reporter un probleme",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 50),
              child: Text(
                "Qu est ce qui passe ?",
                style: TextStyle(color: myTextColor),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/trafic.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Trafic",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/police.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Police",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/acident.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Accident",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/comportemnt.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Querelle",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/roue.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Roue",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/pluie.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Pluie",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CustomIncident()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/pen.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Custom",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
