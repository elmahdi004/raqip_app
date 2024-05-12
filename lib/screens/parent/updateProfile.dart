import 'package:flutter/material.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/screens/components/NavigationItem.dart';
import 'package:raqip_app/screens/parent/children.dart';
import 'package:raqip_app/screens/parent/profile.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});
  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController phoneCode = TextEditingController(text: "+212");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Modifier Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: mainColor),
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
                action: () {},
              ),
              NavigationItem(
                label: "Search",
                icon: Icons.search,
                isActive: false,
                action: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) =>  const Children(child: null,)),
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
                isActive: true,
                action: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Profile(
                            
                          )));
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: secondColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 120),
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Information General :",
                style: TextStyle(color: Color(0xFF8D8989), fontSize: 20),
              ),
              Form(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: 60,
                            child: TextFormField(
                              cursorColor: mainColor,
                              decoration: InputDecoration(
                                  label: const Text(
                                    "Nom",
                                    style: TextStyle(
                                        color: Color(0xFFFFB202), fontSize: 20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 60,
                            child: TextFormField(
                              cursorColor: mainColor,
                              decoration: InputDecoration(
                                  label: const Text(
                                    "Prenom",
                                    style: TextStyle(
                                        color: Color(0xFFFFB202), fontSize: 20),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 60,
                            width: 80,
                            child: TextFormField(
                              cursorColor: mainColor,
                              enabled: false,
                              controller: phoneCode,
                              style:
                                  TextStyle(color: myTextColor, fontSize: 18),
                              decoration: InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 69,
                            child: TextFormField(
                              cursorColor: mainColor,
                              decoration: InputDecoration(
                                  label: const Text(
                                    "Numero",
                                    style: TextStyle(
                                        color: Color(0xFFFFB202), fontSize: 20),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: 69,
                            child: TextFormField(
                              cursorColor: mainColor,
                              decoration: InputDecoration(
                                  label: const Text(
                                    "Email",
                                    style: TextStyle(
                                        color: Color(0xFFFFB202), fontSize: 20),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Information Adresse",
                        style:
                            TextStyle(color: Color(0xFF8D8989), fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: 69,
                            child: TextFormField(
                              cursorColor: mainColor,
                              decoration: InputDecoration(
                                  label: const Text(
                                    "Adresse",
                                    style: TextStyle(
                                        color: Color(0xFFFFB202), fontSize: 20),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: 69,
                            child: TextFormField(
                              cursorColor: mainColor,
                              decoration: InputDecoration(
                                  label: const Text(
                                    "Ville",
                                    style: TextStyle(
                                        color: Color(0xFFFFB202), fontSize: 20),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 60,
                            width: 100,
                            child: TextFormField(
                              cursorColor: mainColor,
                              style:
                                  TextStyle(color: myTextColor, fontSize: 18),
                              decoration: InputDecoration(
                                  label: const Text(
                                    "Code Zip",
                                    style: TextStyle(
                                        color: Color(0xFFFFB202), fontSize: 20),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      ),
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
