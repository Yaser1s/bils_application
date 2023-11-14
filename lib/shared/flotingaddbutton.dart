// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test10/shared/colors.dart';

class FlotingAddButton extends StatefulWidget {
  const FlotingAddButton({super.key});

  @override
  State<FlotingAddButton> createState() => _FlotingAddButtonState();
}

class _FlotingAddButtonState extends State<FlotingAddButton> {
  @override
  Widget build(BuildContext context) {
// time = DateFormat("hh:mm").format(DateTime.now());
//       day = DateFormat("d/M/y").format(DateTime.now());

    String Date = "مفتل";

    List Dates = [
      "مفتل",
      "صقعي",
      "مجدول",
      "برحي",
      "جالكسي",
      "رطب",
    ];

    String DealerName = "ياسر العوس";

    List DealerNames = [
      "الحبلين",
      "النخيل",
      "العريني",
      "نخلات",
      "ياسر العوس",
      "خالد العوس",
      "فهد العوس",
      "نضيد",
    ];

    String PeymentCredet = "شبكة 1";

    List PeymentCredets = [
      "شبكة 1",
      "شبكة 2",
      "شبكة 3",
      "شبكة 4",
      "شبكة 5",
      "شبكة 6",
      "شبكة 7",
      "شبكة 8",
      "شبكة 9",
      "شبكة 10",
      "شبكة 11",
      "شبكة 12",
    ];

    final NameCnt = TextEditingController();
    final NumbersCnt = TextEditingController();
    final priceCnt = TextEditingController();
    final CachCnt = TextEditingController();

    late int Counts;
    late double Price;
    late double allprice;
    trya() {
      setState(() {
        Counts = int.parse(NumbersCnt.text);
        Price = double.parse(priceCnt.text);
        allprice = Price * Counts;
      });
    }

    return FloatingActionButton(
      backgroundColor: flotingAddColor,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Card(
                  color: backgrond,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 140),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: 360,
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Image.asset(
                                "assets/images/logo.jpeg",
                                height: 70,
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 40,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.3),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: SvgPicture.asset(
                                              "assets/images/scan-icon.svg",
                                              height: 30),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 9,
                                        child: Container(
                                          margin: const EdgeInsets.all(5),
                                          padding: const EdgeInsets.all(5),
                                          height: 40,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.3),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: TextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: NameCnt,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "ادخل اسم المزارع",
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 17),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.3),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Column(
                                            children: [
                                              Text(
                                                "رقم",
                                                style: TextStyle(
                                                  fontSize: 9,
                                                ),
                                              ),
                                              Text(
                                                "64633",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 15,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 67,
                                              width: double.infinity,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: DropdownButtonFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1)),
                                                    labelText: "اختر نوع التمر",
                                                  ),
                                                  dropdownColor:
                                                      const Color.fromARGB(
                                                          255, 212, 156, 130),
                                                  iconSize: 60,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  elevation: 15,
                                                  items: Dates.map((item) =>
                                                      DropdownMenuItem(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        value: item,
                                                        child: Text(item,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 20)),
                                                      )).toList(),
                                                  onChanged: (item) {
                                                    setState(() {
                                                      Date = (item as String?)!;
                                                    });
                                                  },
                                                  value: Date),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    left: 7),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 1.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                width: double.infinity,
                                                child: TextField(
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  controller: NumbersCnt,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "ادخل العدد",
                                                    hintStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 17),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 1.3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                width: double.infinity,
                                                padding: const EdgeInsets.only(
                                                    left: 7),
                                                child: TextField(
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  controller: priceCnt,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "سعر الكرتون",
                                                    hintStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 17),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 30, left: 5),
                                      child: ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color.fromARGB(
                                                        104, 107, 40, 6))),
                                        onPressed: () {
                                          trya();
                                          Navigator.pop(context);
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  child: Container(
                                                    width: 100,
                                                    height: 350,
                                                    color: const Color.fromARGB(
                                                        104, 107, 40, 6),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            22),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                ElevatedButton(
                                                                    style: const ButtonStyle(
                                                                        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(
                                                                            75,
                                                                            90,
                                                                            37,
                                                                            10))),
                                                                    onPressed:
                                                                        () {
                                                                      // AddNewBill(
                                                                      //     Date,
                                                                      //     "كاش",
                                                                      //     Trader,
                                                                      //     Counts,
                                                                      //     Price,
                                                                      //     allprice,
                                                                      //     allprice);
                                                                      Navigator
                                                                          .pop(
                                                                        context,
                                                                      );
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      "كاش",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              22),
                                                                    )),
                                                                const SizedBox(
                                                                  height: 30,
                                                                ),
                                                                ElevatedButton(
                                                                    style: const ButtonStyle(
                                                                        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(
                                                                            104,
                                                                            94,
                                                                            60,
                                                                            44))),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (BuildContext context) {
                                                                            return Card(
                                                                              color: const Color.fromARGB(255, 252, 204, 180),
                                                                              margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 290),
                                                                              child: Row(
                                                                                children: [
                                                                                  const Expanded(child: SizedBox()),
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Column(
                                                                                      children: [
                                                                                        const SizedBox(
                                                                                          height: 20,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: 65,
                                                                                          width: double.infinity,
                                                                                          child:
                                                                                              //
                                                                                              DropdownButtonFormField(
                                                                                            decoration: const InputDecoration(
                                                                                              border: OutlineInputBorder(),
                                                                                              labelText: "اختر رقم الشبكة",
                                                                                            ),
                                                                                            dropdownColor: const Color.fromARGB(255, 212, 156, 130),
                                                                                            hint: const Text("شبكة رقم"),
                                                                                            icon: const Icon(Icons.arrow_drop_down),
                                                                                            iconSize: 36,
                                                                                            style: const TextStyle(color: Colors.black, fontSize: 22),
                                                                                            value: PeymentCredet,
                                                                                            onChanged: (item) {
                                                                                              setState(() {
                                                                                                PeymentCredet = (item as String);
                                                                                              });
                                                                                            },
                                                                                            items: PeymentCredets.map((item) => DropdownMenuItem(
                                                                                                  alignment: Alignment.centerLeft,
                                                                                                  value: item,
                                                                                                  child: Text(item, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
                                                                                                )).toList(),
                                                                                          ),
                                                                                        ),
                                                                                        const SizedBox(height: 20),
                                                                                        ElevatedButton(
                                                                                            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(99, 65, 52, 46))),
                                                                                            onPressed: () {
                                                                                              Navigator.pop(context);
                                                                                              // AddNewBill(Date, PeymentCredet, PeymentCredet, Counts, Price, 0, allprice);
                                                                                            },
                                                                                            child: const Text("حفظ"))
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  const Expanded(child: SizedBox())
                                                                                ],
                                                                              ),
                                                                            );
                                                                          });
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      "شبكة",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              22),
                                                                    )),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                ElevatedButton(
                                                                    style: const ButtonStyle(
                                                                        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(
                                                                            104,
                                                                            94,
                                                                            60,
                                                                            44))),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (BuildContext context) {
                                                                            return Card(
                                                                              color: const Color.fromARGB(255, 252, 204, 180),
                                                                              margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 300),
                                                                              child: Row(
                                                                                children: [
                                                                                  const Expanded(child: SizedBox()),
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Column(
                                                                                      children: [
                                                                                        const SizedBox(
                                                                                          height: 20,
                                                                                        ),
                                                                                        Container(
                                                                                            decoration: BoxDecoration(
                                                                                                border: Border.all(
                                                                                                  color: Colors.black,
                                                                                                  width: 1.3,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(5)),
                                                                                            width: double.infinity,
                                                                                            padding: const EdgeInsets.only(left: 7),
                                                                                            child: TextField(
                                                                                              textInputAction: TextInputAction.done,
                                                                                              controller: CachCnt,
                                                                                              keyboardType: TextInputType.number,
                                                                                              decoration: const InputDecoration(
                                                                                                border: InputBorder.none,
                                                                                                hintText: "الكاش",
                                                                                                hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
                                                                                              ),
                                                                                            )),
                                                                                        const SizedBox(height: 20),
                                                                                        ElevatedButton(
                                                                                            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(99, 65, 52, 46))),
                                                                                            onPressed: () {
                                                                                              Navigator.pop(context);

                                                                                              // AddNewBill(Date, "دمج", Trader, Counts, Price, Cach, allprice);
                                                                                            },
                                                                                            child: const Text("حفظ"))
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  const Expanded(child: SizedBox())
                                                                                ],
                                                                              ),
                                                                            );
                                                                          });
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      "دمج",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              22),
                                                                    )),
                                                                const SizedBox(
                                                                  height: 30,
                                                                ),
                                                                ElevatedButton(
                                                                    style: const ButtonStyle(
                                                                        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(
                                                                            99,
                                                                            65,
                                                                            52,
                                                                            46))),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (BuildContext context) {
                                                                            return Card(
                                                                              color: const Color.fromARGB(255, 252, 204, 180),
                                                                              margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 300),
                                                                              child: Row(
                                                                                children: [
                                                                                  const Expanded(child: SizedBox()),
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Column(
                                                                                      children: [
                                                                                        const SizedBox(
                                                                                          height: 20,
                                                                                        ),
                                                                                        Container(
                                                                                          padding: const EdgeInsets.only(left: 7),
                                                                                          height: 55,
                                                                                          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1.3), borderRadius: BorderRadius.circular(5)),
                                                                                          width: double.infinity,
                                                                                          child: DropdownButtonFormField(
                                                                                            decoration: const InputDecoration(border: InputBorder.none),
                                                                                            dropdownColor: const Color.fromARGB(255, 212, 156, 130),
                                                                                            hint: const Text("التاجر"),
                                                                                            icon: const Icon(Icons.arrow_drop_down),
                                                                                            iconSize: 36,
                                                                                            style: const TextStyle(color: Colors.black, fontSize: 22),
                                                                                            value: DealerName,
                                                                                            onChanged: (item) {
                                                                                              setState(() {
                                                                                                DealerName = (item as String);
                                                                                              });
                                                                                            },
                                                                                            items: DealerNames.map((item) => DropdownMenuItem(
                                                                                                  alignment: Alignment.centerLeft,
                                                                                                  value: item,
                                                                                                  child: Text(item, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
                                                                                                )).toList(),
                                                                                          ),
                                                                                        ),
                                                                                        const SizedBox(height: 20),
                                                                                        ElevatedButton(
                                                                                            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(99, 65, 52, 46))),
                                                                                            onPressed: () {
                                                                                              Navigator.pop(context);

                                                                                              // AddNewBill(Date, DealerName, DealerName, Counts, Price, 0, allprice);
                                                                                            },
                                                                                            child: const Text("حفظ"))
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  const Expanded(child: SizedBox())
                                                                                ],
                                                                              ),
                                                                            );
                                                                          });
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      "تاجر",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              22),
                                                                    )),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const SizedBox(
                                                                height: 10),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 30),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4),
                                                              height: 45,
                                                              // width: 150,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            1.3,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                              child: Text(
                                                                "المجموع : $allprice",
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            18),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: const Text(
                                          "حفظ",
                                          style: TextStyle(fontSize: 22),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            });
      },
      child: const Icon(Icons.add),
    );
  }
}
