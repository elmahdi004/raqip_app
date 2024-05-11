import 'package:flutter/material.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/screens/assistant/assistant_profile.dart';
import 'package:raqip_app/screens/components/NavigationItem.dart';
import 'package:raqip_app/state.dart';

class DashboardAssistant extends StatefulWidget {
  const DashboardAssistant({super.key});

  @override
  State<DashboardAssistant> createState() => _DashboardAssistanrState();
}

class _DashboardAssistanrState extends State<DashboardAssistant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DashboardAssistant()));
                },
              ),
              NavigationItem(
                label: "Search",
                icon: Icons.search,
                isActive: false,
                action: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const Children()));
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AssistantProfile()));
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
