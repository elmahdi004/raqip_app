import 'package:flutter/material.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/models/api_response.dart';
import 'package:raqip_app/screens/assistant/dashboard_assistant.dart';
import 'package:raqip_app/screens/components/NavigationItem.dart';
import 'package:raqip_app/screens/login.dart';
import 'package:raqip_app/screens/parent/updateProfile.dart';
import 'package:raqip_app/services/auth_services.dart';
import 'package:raqip_app/state.dart';

class AssistantProfile extends StatefulWidget {
  const AssistantProfile({super.key});

  @override
  State<AssistantProfile> createState() => _AssistantProfileState();
}

class _AssistantProfileState extends State<AssistantProfile> {
  logout() async {
    ApiResponse apiResponse = await logoutAsAssistant();
    if (apiResponse.error == null) {
      authAssistant = null;
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false);
    }
  }

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
                isActive: false,
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
                isActive: true,
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
        color: secondColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/assistant.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              authAssistant?.name ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 28),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              authAssistant?.email ?? "",
              style: const TextStyle(color: Color(0xFF8D8989), fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UpdateProfile()));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 140),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit),
                    Text(
                      "Modifier",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.help,
                  color: Color(0xFF8D8989),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Assistant",
                  style: TextStyle(color: Color(0xFF8D8989), fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                margin: const EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF1F1F1F),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Message",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                margin: const EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF1F1F1F),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Appeler",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                logout();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                margin: const EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF1F1F1F),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Deconnecte",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
