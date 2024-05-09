import 'package:flutter/material.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/screens/login.dart';
import 'package:raqip_app/screens/parent/dashboardParent.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: secondColor,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                "raQip",
                style: TextStyle(
                    color: Color(0xFFFFB202),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "Learn about your child",
                style: TextStyle(
                    color: Color(0xFFFFB202),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/images/bus.png',
                fit: BoxFit.cover,
                width: 200,
              ),
            ),
            const Spacer(),
            Container(
              height: 350,
              width: 440,
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  const Spacer(),
                  Form(
                      child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 320,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: secondColor),
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextFormField(
                          style: TextStyle(color: mainColor, fontSize: 19),
                          cursorColor: mainColor,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nom d'utilisateur ou email",
                              hintStyle: TextStyle(
                                  color: Color(0xFF8D8989), fontSize: 20)),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 320,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: secondColor),
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(color: mainColor, fontSize: 19),
                          cursorColor: mainColor,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.remove_red_eye),
                              border: InputBorder.none,
                              hintText: "Mot de pass",
                              hintStyle: TextStyle(
                                  color: Color(0xFF8D8989), fontSize: 20)),
                        ),
                      ),
                    ],
                  )),
                  const Spacer(),
                  Container(
                    height: 70,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: secondColor),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      color: secondColor,
                      textColor: Colors.white,
                      child: const Text(
                        "se connecter",
                        style: TextStyle(fontSize: 23),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DashboardParent()));
                      },
                    ),
                  ),
                  const Spacer()
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
