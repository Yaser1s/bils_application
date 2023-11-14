// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:test10/firebases/firebase_bills.dart';
import 'package:test10/shared/colors.dart';

class AddBillDamge extends StatefulWidget {
  final String uidFarmar;
  final String nameFarmar;
  final String uidDrivar;
  final String numberFarm;
  final double price;
  final double conts;
  final double allPrice;
  final String typeDate;
  const AddBillDamge({
    super.key,
    required this.uidFarmar,
    required this.nameFarmar,
    required this.uidDrivar,
    required this.numberFarm,
    required this.price,
    required this.conts,
    required this.allPrice,
    required this.typeDate,
  });

  @override
  State<AddBillDamge> createState() => _AddBillDamgeState();
}

class _AddBillDamgeState extends State<AddBillDamge> {
  //

  final cachCnt = TextEditingController();

  String peymentCredet = "شبكة 1";

  List peymentCredets = [
    "شبكة 1",
    "شبكة 2",
    "شبكة 3",
    "شبكة 4",
    "شبكة 5",
  ];

  @override
  void dispose() {
    cachCnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 200),
        child: Scaffold(
            backgroundColor: backgrond,
            body: Column(children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.3),
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
                              fontWeight: FontWeight.w300, fontSize: 17)))),
              const SizedBox(height: 20),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 65,
                  width: double.infinity,
                  child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "اختر رقم الشبكة"),
                      dropdownColor: backgrond,
                      hint: const Text("شبكة رقم"),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      style:
                          const TextStyle(color: textColorsBlack, fontSize: 22),
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
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(buttons)),
                  onPressed: () async {
                    await AddBill().addNewBil(
                      uidDriver: widget.uidDrivar,
                      nameFarmar: widget.nameFarmar,
                      numberDriver: widget.numberFarm,
                      uidFarmar: widget.uidFarmar,
                      typeDate: widget.typeDate,
                      typePuy: "دمج",
                      conts: widget.conts,
                      price: widget.price,
                      allPrice: widget.allPrice,
                      numberCachMachen: peymentCredet,
                      cach: double.parse(cachCnt.text),
                      context: context,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("حفظ")),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.all(4),
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text("المجموع : ${widget.allPrice}",
                        style: const TextStyle(fontSize: 18)))
              ])
            ])));
  }
}
