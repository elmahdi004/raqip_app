import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/screens/components/NavigationItem.dart';

class DashboardParent extends StatefulWidget {
  const DashboardParent({super.key});

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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigationItem(
                  label: "Home",
                  icon: Icons.home,
                  isActive: true,
                ),
                NavigationItem(
                  label: "Search",
                  icon: Icons.search,
                  isActive: false,
                ),
                NavigationItem(
                  label: "Contact",
                  icon: Icons.comment,
                  isActive: false,
                ),
                NavigationItem(
                  label: "Profile",
                  icon: Icons.verified_user,
                  isActive: false,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: secondColor,
          actions: [
            IconButton(
                onPressed: () {},
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
              const Text(
                "Hi, El mahdi",
                style: TextStyle(
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
                          Row(
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
