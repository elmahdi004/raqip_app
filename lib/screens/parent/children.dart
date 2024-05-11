import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/screens/components/NavigationItem.dart';
import 'package:raqip_app/screens/parent/dashboardParent.dart';
import 'package:raqip_app/screens/parent/profile.dart';

class Children extends StatefulWidget {
  const Children({super.key});

  @override
  State<Children> createState() => _ChildrenState();
}

class _ChildrenState extends State<Children> {
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DashboardParent()));
                },
              ),
              NavigationItem(
                label: "Search",
                icon: Icons.search,
                isActive: true,
                action: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const Children()),
                      (route) => false);
                },
              ),
              NavigationItem(
                label: "Contact",
                icon: Icons.comment,
                isActive: false,
                action: () {},
              ),
              NavigationItem(
                label: "Profile",
                icon: Icons.verified_user,
                isActive: false,
                action: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 40,
                color: Colors.white,
              ))
        ],
        backgroundColor: secondColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          color: secondColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 170),
                child: const Text(
                  "Find your Child :",
                  style: TextStyle(color: Color(0xFF8D8989), fontSize: 25),
                ),
              ),
              Form(
                  child: Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: 370,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: mainColor, width: 3),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextFormField(
                  style: TextStyle(color: mainColor),
                  cursorColor: mainColor,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      hintText: "find ...",
                      hintStyle: TextStyle(color: myTextColor, fontSize: 18),
                      suffixIcon: Icon(
                        Icons.search,
                        color: mainColor,
                        size: 30,
                      )),
                ),
              )),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                  ),
                  width: 370,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 55,
                              height: 55,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  "assets/images/child.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Elmahdi bellaziz",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "en bus",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 50,
              // ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                  ),
                  width: 370,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 55,
                              height: 55,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  "assets/images/child.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Elmahdi bellaziz",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "à l'école",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
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
      ),
    );
  }
}
