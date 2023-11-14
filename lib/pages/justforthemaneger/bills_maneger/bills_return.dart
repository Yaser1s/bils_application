import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test10/shared/colors.dart';

class BillsReturn extends StatefulWidget {
  final Map data;
  const BillsReturn({super.key, required this.data});

  @override
  State<BillsReturn> createState() => _BillsReturnState();
}

class _BillsReturnState extends State<BillsReturn> {
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${widget.data["NumberDriver"]} : الرقم",
                                  style: const TextStyle(
                                      fontSize: 20, color: textColorsBlack))
                            ]),
                        Row(children: [
                          Text("اسم المزارع : ${widget.data["NameFarmar"]}",
                              style: const TextStyle(
                                  fontSize: 20, color: textColorsBlack))
                        ])
                      ]),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text("نوع التمر : ${widget.data["TypeDate"]}",
                          style: const TextStyle(
                              fontSize: 20, color: textColorsBlack))
                    ]),
                    const SizedBox(width: 30),
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${widget.data["Counts"]} : العدد",
                                  style: const TextStyle(
                                      fontSize: 20, color: textColorsBlack))
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("المجموع : ${widget.data["AllPrice"]}",
                                  style: const TextStyle(
                                      fontSize: 20, color: textColorsBlack))
                            ]),
                        // Row(children: [
                        //   Text("السعر : ${widget.data["Price"]}",
                        //       style: const TextStyle(
                        //           fontSize: 20, color: textColorsBlack))
                        // ])
                      ]),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                        widget.data["TypePuy"] == "شبكة"
                            ? " الحساب : ${widget.data["NumberCachMachen"]}"
                            : widget.data["TypePuy"] == "تاجر"
                                ? " المشتري : ${widget.data["NameDelars"]}"
                                : " الحساب : ${widget.data["TypePuy"]}",
                        style: const TextStyle(
                            fontSize: 20, color: textColorsBlack))
                  ]),
                  if (widget.data["TypePuy"] == "دمج")
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("شبكة رقم : ${widget.data["NumberCachMachen"]}",
                              style: const TextStyle(
                                  fontSize: 20, color: textColorsBlack)),
                          Text("الكاش : ${widget.data["Cach"]}",
                              style: const TextStyle(
                                  fontSize: 20, color: textColorsBlack))
                        ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("م90",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: textColorsBlack))
                                  ]),
                            ]),
                        Row(children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                DateFormat('a').format(
                                            widget.data["DateTime"].toDate()) ==
                                        "AM"
                                    ? Text(
                                        DateFormat('hh:mmص').format(
                                            widget.data["DateTime"].toDate()),
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: textColorsBlack))
                                    : Text(
                                        DateFormat('hh:mmم').format(
                                            widget.data["DateTime"].toDate()),
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: textColorsBlack)),
                              ]),
                        ])
                      ]),
                ])));
  }
}
