import 'package:flutter/material.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/screens/components/NavigationItem.dart';
import 'package:raqip_app/screens/notification.dart';
import 'package:raqip_app/screens/parent/child_position.dart';
import 'package:raqip_app/screens/parent/children.dart';
import 'package:raqip_app/screens/parent/profile.dart';
import 'package:raqip_app/state.dart';

class DashboardParent extends StatefulWidget {
  const DashboardParent({super.key, required this.child});
  final dynamic child;
  @override
  State<DashboardParent> createState() => _DashboardParentState();
}

class _DashboardParentState extends State<DashboardParent> {
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
                  action: () {},
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
                NavigationItem(
                  label: "Profile",
                  icon: Icons.verified_user,
                  isActive: false,
                  action: () {},
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
                            child: const Icon(Icons.sync_problem),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "comportement",
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
            ],
          ),
        ));
  }
}
