import 'package:flutter/material.dart';
import 'package:raqip_app/constant.dart';
import 'package:raqip_app/services/assistant_services.dart';

class IncidentWithType extends StatefulWidget {
  const IncidentWithType({super.key, required this.route, required this.type});
  final dynamic route;
  final String type;
  @override
  State<IncidentWithType> createState() => IncidentWithTypeState();
}

class IncidentWithTypeState extends State<IncidentWithType> {
  TextEditingController type = TextEditingController();

  TextEditingController description = TextEditingController();
  @override
  void initState() {
    type.text = widget.type;
    super.initState();
  }

  bool loading = false;
  handleCreateIncident() async {
    setState(() {
      loading = true;
    });
    await createIncident(widget.route["id"], widget.type, description.text);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondColor,
          iconTheme: IconThemeData(color: mainColor),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: secondColor,
          child: Form(
            child: ListView(children: [
              const Row(
                children: [
                  Icon(
                    Icons.warning_amber_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Reporter un probleme",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "Qu est ce qui passe ?",
                  style: TextStyle(color: myTextColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Text(
                    "Quel est le type du probleme ?",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "  *",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  style: TextStyle(color: mainColor),
                  enabled: false,
                  controller: type,
                  cursorColor: mainColor,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "type de probleme",
                      hintStyle:
                          TextStyle(color: Color(0xFF8D8989), fontSize: 17)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Text(
                    "Une description sur le probleme",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "  *",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  style: TextStyle(color: mainColor),
                  controller: description,
                  maxLines: null,
                  cursorColor: mainColor,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "description",
                      hintStyle:
                          TextStyle(color: Color(0xFF8D8989), fontSize: 17)),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF1F1F1F),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        "Annuler",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  loading
                      ? Container(
                          width: 50,
                          height: 120,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: mainColor,
                            ),
                          ),
                        )
                      : Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: mainColor,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              handleCreateIncident();
                            },
                            child: const Text(
                              "Enregistre",
                              style: TextStyle(
                                  color: Color(0xFF151418), fontSize: 18),
                            ),
                          ),
                        ),
                ],
              )
            ]),
          ),
        ));
  }
}
