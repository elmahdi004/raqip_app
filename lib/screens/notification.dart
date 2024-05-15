import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/models/api_response.dart';
import 'package:raqip_app/services/parent_services.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  bool empty = false;
  bool loading = false;
  List<dynamic> notifications = [];
  getMyNotificationsHandle() async {
    setState(() {
      loading = true;
    });
    ApiResponse response = await getMyNotifications();
    if (response.error == null) {
      notifications = response.data as List<dynamic>;
      if (notifications.isEmpty) {
        setState(() {
          empty = true;
        });
      }
    }
    setState(() {
      loading = false;
    });
  }

  String changeTimestampFormat(dynamic time) {
    final DateFormat formatter = DateFormat('HH:mm, dd MMM');

    DateTime? startDateParsed = time != null ? DateTime.parse(time) : null;

    return startDateParsed != null ? formatter.format(startDateParsed) : "";
  }

  @override
  void initState() {
    getMyNotificationsHandle();
    super.initState();
  }

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
                    child: loading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: mainColor,
                            ),
                          )
                        : Column(
                            children: [
                              ...List.generate(
                                  notifications.length,
                                  (index) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF1F1F1F),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: Image.asset(
                                                        "assets/images/assistant.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  SizedBox(
                                                    width: 250,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                              notifications[
                                                                          index]
                                                                      ["data"]
                                                                  ["message"],
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16),
                                                            ),
                                                            Text(
                                                              changeTimestampFormat(
                                                                  notifications[
                                                                          index]
                                                                      [
                                                                      "created_at"]),
                                                              style: const TextStyle(
                                                                  fontSize: 11,
                                                                  color: Color(
                                                                      0xFF8D8989)),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          notifications[index]
                                                              ["data"]["body"],
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white),
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
