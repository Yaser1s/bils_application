import 'package:flutter/material.dart';

class DriversDesgin extends StatefulWidget {
  final Map data;
  const DriversDesgin({super.key, required this.data});

  @override
  State<DriversDesgin> createState() => _DriversDesginState();
}

class _DriversDesginState extends State<DriversDesgin> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(55, 0, 0, 0),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(widget.data["NameFarmar"],
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 23)),
                    const Text(" : صاحب المزرعة",
                        style: TextStyle(fontSize: 20))
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(children: [
                      Text(widget.data["DriverPhoneNumber"],
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontSize: 16))
                    ]),
                    const Text(" : رقم جوال السواق",
                        style: TextStyle(fontSize: 17))
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(children: [
                      Text(widget.data["DriverNumber"],
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontSize: 16))
                    ]),
                    const Text(" : رقم المزرعة", style: TextStyle(fontSize: 17))
                  ]),
                  widget.data["Bills"].length == 0
                      ? const SizedBox(height: 2)
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${widget.data["Bills"].length}",
                                        style: const TextStyle(fontSize: 20))
                                  ]),
                              const Text(" : عدد الفواتير",
                                  style: TextStyle(fontSize: 20))
                            ]),
                  widget.data["Bills"].length == 0
                      ? const SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${widget.data["Cach"]}",
                                        style: const TextStyle(fontSize: 20))
                                  ]),
                              const Text(" :  مجموع حساب الفواتير",
                                  style: TextStyle(fontSize: 20))
                            ])
                ])));
  }
}
