import 'package:flutter/material.dart';
import 'package:test10/firebases/firebase_bills.dart';
import 'package:test10/shared/colors.dart';

class BillCredit extends StatefulWidget {
  final String uidFarmar;
  final String nameFarmar;
  final String uidDrivar;
  final String numberFarm;
  final double price;
  final double conts;
  final String typeDate;
  final double allPrice;
  final String typePay;
  const BillCredit({
    super.key,
    required this.uidFarmar,
    required this.nameFarmar,
    required this.uidDrivar,
    required this.numberFarm,
    required this.price,
    required this.conts,
    required this.typeDate,
    required this.allPrice,
    required this.typePay,
  });

  @override
  State<BillCredit> createState() => _BillCreditState();
}

class _BillCreditState extends State<BillCredit> {
  String peymentCredet = "شبكة 1";
  final cachCnt = TextEditingController();
  List peymentCredets = [
    "شبكة 1",
    "شبكة 2",
    "شبكة 3",
    "شبكة 4",
    "شبكة 5",
  ];
  double cach = 0;
  int pepowr = 1;
  //

  //

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 200),
        child: Scaffold(
            backgroundColor: backgrond,
            body: Row(children: [
              Expanded(
                  flex: 4,
                  child: Column(children: [
                    widget.typePay == "دمج"
                        ? Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1.3),
                                borderRadius: BorderRadius.circular(5)),
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 7),
                            child: TextField(
                                textInputAction: TextInputAction.done,
                                controller: cachCnt,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "الكاش",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 17))))
                        : const SizedBox(),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        height: 65,
                        width: double.infinity,
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "اختر رقم الشبكة"),
                            dropdownColor: flotingAddColor,
                            hint: const Text("شبكة رقم"),
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            style: const TextStyle(
                                color: textColorsBlack, fontSize: 22),
                            value: peymentCredet,
                            onChanged: (item) {
                              setState(() {
                                peymentCredet = (item as String);
                              });
                            },
                            items: peymentCredets
                                .map((item) => DropdownMenuItem(
                                    alignment: Alignment.centerLeft,
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20))))
                                .toList())),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(buttons)),
                        onPressed: () {
                          AddBill().addNewBil(
                              uidDriver: widget.uidDrivar,
                              nameFarmar: widget.nameFarmar,
                              uidFarmar: widget.uidFarmar,
                              numberDriver: widget.numberFarm,
                              typeDate: widget.typeDate,
                              typePuy: widget.typePay,
                              conts: widget.conts,
                              price: widget.price,
                              allPrice: widget.conts * widget.price,
                              numberCachMachen: peymentCredet,
                              cach: widget.typePay == "شبكة"
                                  ? 0.0
                                  : double.parse(cachCnt.text),
                              context: context);
                          Navigator.pop(context);
                        },
                        child: const Text("حفظ"))
                  ]))
            ])));
  }
}

// import 'package:flutter/material.dart';
// import 'package:test10/firebases/firebase_bills.dart';
// import 'package:test10/shared/colors.dart';

// class BillCredit extends StatefulWidget {
//   final String uidFarmar;
//   final String nameFarmar;
//   final String uidDrivar;
//   final String numberFarm;
//   final double price;
//   final double conts;
//   final double allPrice;
//   final String typeDate;
//   final String pay;
//   const BillCredit({
//     super.key,
//     required this.uidFarmar,
//     required this.nameFarmar,
//     required this.uidDrivar,
//     required this.numberFarm,
//     required this.price,
//     required this.conts,
//     required this.allPrice,
//     required this.typeDate,
//     required this.pay,
//   });

//   @override
//   State<BillCredit> createState() => _BillCreditState();
// }

// class _BillCreditState extends State<BillCredit> {
//   //

//   final cachCnt = TextEditingController();
//   String peymentCredet = "شبكة 1";

//   List peymentCredets = [
//     "شبكة 1",
//     "شبكة 2",
//     "شبكة 3",
//     "شبكة 4",
//     "شبكة 5",
//   ];
//   double cach = 0;
//   int pepowr = 1;
//   //

//   //

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 200),
//         child: Scaffold(
//             backgroundColor: backgrond,
//             body: Row(children: [
//               Column(children: [
//                 const SizedBox(height: 20),
//                 widget.pay == "دمج"
//                     ? Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black, width: 1.3),
//                             borderRadius: BorderRadius.circular(5)),
//                         width: double.infinity,
//                         padding: const EdgeInsets.only(left: 7),
//                         child: TextField(
//                             textInputAction: TextInputAction.done,
//                             controller: cachCnt,
//                             keyboardType: TextInputType.number,
//                             decoration: const InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: "الكاش",
//                                 hintStyle: TextStyle(
//                                     fontWeight: FontWeight.w300,
//                                     fontSize: 17))))
//                     : const SizedBox(),
//                 const SizedBox(height: 20),
//                 Container(
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 10),
//                     width: double.infinity,
//                     child: DropdownButtonFormField(
//                         decoration: const InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: "اختر رقم الشبكة"),
//                         dropdownColor: backgrond,
//                         hint: const Text("شبكة رقم"),
//                         icon: const Icon(Icons.arrow_drop_down),
//                         iconSize: 36,
//                         style: const TextStyle(
//                             color: textColorsBlack, fontSize: 22),
//                         value: peymentCredet,
//                         onChanged: (item) {
//                           setState(() {
//                             peymentCredet = (item as String);
//                           });
//                         },
//                         items: peymentCredets
//                             .map((item) => DropdownMenuItem(
//                                 alignment: Alignment.centerLeft,
//                                 value: item,
//                                 child: Text(item,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 20))))
//                             .toList())),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                     style: const ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll(buttons)),
//                     onPressed: () {
//                       AddBill().addNewBil(
//                           uidDriver: widget.uidDrivar,
//                           nameFarmar: widget.nameFarmar,
//                           uidFarmar: widget.uidFarmar,
//                           numberDriver: widget.numberFarm,
//                           typeDate: widget.typeDate,
//                           typePuy: widget.pay,
//                           conts: widget.conts,
//                           price: widget.price,
//                           allPrice: widget.allPrice,
//                           numberCachMachen: peymentCredet,
//                           cach: widget.pay == "دمج"
//                               ? double.parse(cachCnt.text)
//                               : 0.0,
//                           context: context);
//                       Navigator.pop(context);
//                     },
//                     child: const Text("حفظ"))
              
//               ])
//             ])));
//   }
// }
