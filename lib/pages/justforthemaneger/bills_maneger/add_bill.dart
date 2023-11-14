import 'package:flutter/material.dart';
import 'package:test10/Pages/justforthemaneger/bills_maneger/add_bill2.dart';
import 'package:test10/shared/colors.dart';

class AddBillNew extends StatefulWidget {
  final String nameFarmar;
  final String uidFarmar;
  final String uidDriver;
  final String numberFarm;

  const AddBillNew(
      {super.key,
      required this.nameFarmar,
      required this.uidFarmar,
      required this.uidDriver,
      required this.numberFarm});

  @override
  State<AddBillNew> createState() => _AddBillNewState();
}

class _AddBillNewState extends State<AddBillNew> {
  String date = "مفتل";
  List dates = [
    "مفتل",
    "صقعي",
    "مجدول",
    "برحي",
    "جالكسي",
    "رطب",
  ];
  //

  final priceCnt = TextEditingController();
  final countsCnt = TextEditingController();

  //

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 120),
      child: Scaffold(
        backgroundColor: backgrond,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("صاحب المزرعة : ${widget.nameFarmar}",
                                style: TextStyle(
                                    fontSize: 23, color: Colors.grey[800]))
                          ])),
                  Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("#${widget.numberFarm}",
                                style: TextStyle(
                                    fontSize: 23, color: Colors.grey[800])),
                            Text(" : رقم المزرعة",
                                style: TextStyle(
                                    fontSize: 23, color: Colors.grey[800]))
                          ]))
                ]),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Column(children: [
                      Container(
                          height: 65,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.3),
                              borderRadius: BorderRadius.circular(5)),
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 50),
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              dropdownColor:
                                  const Color.fromARGB(255, 168, 186, 192),
                              iconSize: 50,
                              alignment: AlignmentDirectional.center,
                              borderRadius: BorderRadius.circular(5),
                              elevation: 15,
                              items: dates
                                  .map((item) => DropdownMenuItem(
                                      alignment: Alignment.centerRight,
                                      value: item,
                                      child: Text(item,
                                          style: const TextStyle(
                                              color: textColorsBlack,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20))))
                                  .toList(),
                              onChanged: (item) {
                                setState(() {
                                  date = (item as String?)!;
                                });
                              },
                              value: date)),
                      const SizedBox(height: 15),
                      Container(
                          padding: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.3),
                              borderRadius: BorderRadius.circular(5)),
                          width: double.infinity,
                          child: TextField(
                              controller: countsCnt,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "ادخل العدد",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17)))),
                      const SizedBox(height: 15),
                      Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.3),
                              borderRadius: BorderRadius.circular(5)),
                          width: double.infinity,
                          padding: const EdgeInsets.only(right: 10),
                          child: TextField(
                              textInputAction: TextInputAction.done,
                              controller: priceCnt,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "سعر الكرتون",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17))))
                    ])),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30, left: 5),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(buttons)),
                        onPressed: () {
                          if (priceCnt.text.isNotEmpty ||
                              countsCnt.text.isNotEmpty) {
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddNewBill2(
                                      uidFarmar: widget.uidFarmar,
                                      nameFarmar: widget.nameFarmar,
                                      uidDrivar: widget.uidDriver,
                                      numberFarm: widget.numberFarm,
                                      price: double.parse(priceCnt.text),
                                      conts: double.parse(countsCnt.text),
                                      allPrice: double.parse(priceCnt.text) *
                                          double.parse(countsCnt.text),
                                      typeDate: date);
                                });
                          }
                        },
                        child: const Text(
                          "حفظ",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
