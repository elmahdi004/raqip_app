import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:raqip_app/constant.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  bool empty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: mainColor),
          backgroundColor: secondColor,
          title: const Text(
            "Notifications",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: empty
                ? Container(
                    color: secondColor,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 200,
                            child:
                                Image.asset("assets/images/mailbox-empty.png"),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Pas encore de notifications",
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Vos notifications apparaîtront ici une fois que vous les aurez reçues",
                            style: TextStyle(
                                color: myTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 80),
                    // height: MediaQuery.of(context).size.height - 80,
                    color: secondColor,
                    child: Column(
                      children: [
                        ...List.generate(
                            7,
                            (index) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF1F1F1F),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.asset(
                                                  "assets/images/assistant.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            const SizedBox(
                                              width: 250,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "we have a problem",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17),
                                                      ),
                                                      Text(
                                                        "Dec 16,2023",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF8D8989)),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                      ],
                    ))));
  }
}
