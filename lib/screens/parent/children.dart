import 'package:flutter/material.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/models/api_response.dart';
import 'package:raqip_app/screens/parent/dashboardParent.dart';
import 'package:raqip_app/services/parent_services.dart';

class Children extends StatefulWidget {
  const Children({super.key, required this.child});
  final dynamic child;
  @override
  State<Children> createState() => _ChildrenState();
}

class _ChildrenState extends State<Children> {
  bool loading = false;
  List<dynamic> children = [];
  @override
  void initState() {
    getChildrenHandle();
    super.initState();
  }

  getChildrenHandle() async {
    setState(() {
      loading = true;
    });
    ApiResponse response = await getChildren();
    if (response.error == null) {
      children = response.data as List<dynamic>;
    }
    setState(() {
      loading = false;
    });
  }

  String truncateString(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + '...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 90,
          padding: const EdgeInsets.all(20),
          color: secondColor,
          child: loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 170),
                      child: const Text(
                        "trouvez votre enfant :",
                        style:
                            TextStyle(color: Color(0xFF8D8989), fontSize: 18),
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
                      children.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DashboardParent(child: children[index])));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: widget.child != null &&
                                  widget.child["child_id"] ==
                                      children[index]["child_id"]
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.green),
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
                                          "assets/images/child.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        truncateString(
                                            children[index]["username"], 10),
                                        style: children[index]["status"] ==
                                                "en bus"
                                            ? const TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17)
                                            : const TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17))
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
                                      decoration:
                                          children[index]["status"] == "en bus"
                                              ? BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.green)
                                              : BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.red),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      children[index]["status"],
                                      style:
                                          children[index]["status"] == "en bus"
                                              ? const TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600)
                                              : const TextStyle(
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
