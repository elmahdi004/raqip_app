import 'package:flutter/material.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/models/api_response.dart';
import 'package:raqip_app/screens/assistant/dashboard_assistant.dart';
import 'package:raqip_app/services/assistant_services.dart';

class Routes extends StatefulWidget {
  const Routes({super.key, required this.route});

  final dynamic route;

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  List<dynamic> data = [];
  bool loading = false;

  @override
  void initState() {
    print("================= ${widget.route}");
    getRoutesHandle();
    super.initState();
  }

  getRoutesHandle() async {
    setState(() {
      loading = true;
    });
    ApiResponse apiResponse = await getRoutes();
    if (apiResponse.error == null) {
      data = apiResponse.data as List<dynamic>;
      setState(() {});
    } else {
      print("-------------------- ${apiResponse.error}");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: SafeArea(
      //   child: Container(
      //     height: 70,
      //     decoration: const BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.all(Radius.circular(24))),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         NavigationItem(
      //           label: "Home",
      //           icon: Icons.home,
      //           isActive: false,
      //           action: () {
      //             Navigator.of(context).pushAndRemoveUntil(
      //                 MaterialPageRoute(
      //                     builder: (context) =>
      //                         DashboardAssistant(route: widget.route)),
      //                 (route) => false);
      //           },
      //         ),
      //         NavigationItem(
      //           label: "Search",
      //           icon: Icons.search,
      //           isActive: true,
      //           action: () {
      //             Navigator.of(context).pushAndRemoveUntil(
      //                 MaterialPageRoute(builder: (context) =>  Routes(route: widget.route,)),
      //                 (route) => false);
      //           },
      //         ),
      //         NavigationItem(
      //           label: "Contact",
      //           icon: Icons.comment,
      //           isActive: false,
      //           action: () {
      //             Navigator.of(context).pushAndRemoveUntil(
      //                 MaterialPageRoute(
      //                     builder: (context) => Incident(
      //                           route: widget.route,
      //                         )),
      //                 (route) => false);
      //           },
      //         ),
      //         NavigationItem(
      //           label: "Children",
      //           icon: Icons.supervised_user_circle_outlined,
      //           isActive: false,
      //           action: () {
      //             Navigator.of(context).pushAndRemoveUntil(
      //                 MaterialPageRoute(
      //                     builder: (context) => BusChildren(
      //                           route: widget.route,
      //                         )),
      //                 (route) => false);
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        backgroundColor: secondColor,
      ),
      body: SingleChildScrollView(
        child: loading
            ? Container(
                color: secondColor,
                width: MediaQuery.of(context).size.width,
                height: 720,
                child: Center(
                    child: CircularProgressIndicator(
                  color: mainColor,
                )),
              )
            : Container(
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
                        "Bus Routes :",
                        style:
                            TextStyle(color: Color(0xFF8D8989), fontSize: 25),
                      ),
                    ),
                    Form(
                        child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: 370,
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(color: mainColor, width: 3),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        style: TextStyle(color: mainColor),
                        cursorColor: mainColor,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "find ...",
                            hintStyle:
                                TextStyle(color: myTextColor, fontSize: 18),
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
                    ...List.generate(
                      data.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DashboardAssistant(route: data[index])),
                              (route) => false);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: widget.route != null &&
                                  widget.route["id"] == data[index]["id"]
                              ? BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black,
                                )
                              : BoxDecoration(
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
                                          "assets/images/route.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      data[index]["name"],
                                      style: const TextStyle(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.green),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )

                    // const SizedBox(
                    //   height: 50,
                    // ),
                  ],
                ),
              ),
      ),
    );
  }
}
