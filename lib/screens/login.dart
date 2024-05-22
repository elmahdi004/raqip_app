import 'package:flutter/material.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/screens/loginForm.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        // padding: const EdgeInsets.all(40),
        color: secondColor,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text(
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
                "Suivez vos enfants en toute simplicité",
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
                width: 240,
              ),
            ),
            const Spacer(),
            Container(
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    height: 70,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: secondColor,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: MaterialButton(
                      textColor: Colors.white,
                      child: const Text(
                        "se connecter",
                        style: TextStyle(fontSize: 23),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginForm()));
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
    );
  }
}
