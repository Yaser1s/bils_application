// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test10/Pages/justforthemaneger/bills_maneger/add_bill_delar2.dart';
import 'package:test10/Pages/justforthemaneger/bills_maneger/bill_creadit.dart';
import 'package:test10/firebases/firebase_bills.dart';
import 'package:test10/shared/colors.dart';

class AddNewBill2 extends StatefulWidget {
  final String uidFarmar;
  final String nameFarmar;
  final String uidDrivar;
  final String numberFarm;
  final double price;
  final double conts;
  final String typeDate;
  final double allPrice;
  const AddNewBill2({
    super.key,
    required this.uidFarmar,
    required this.nameFarmar,
    required this.uidDrivar,
    required this.numberFarm,
    required this.price,
    required this.conts,
    required this.typeDate,
    required this.allPrice,
  });

  @override
  State<AddNewBill2> createState() => _AddNewBill2State();
}

class _AddNewBill2State extends State<AddNewBill2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(60, 200, 60, 230),
        child: Scaffold(
            backgroundColor: backgrond,
            body: Column(children: [
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(buttons)),
                      onPressed: () {
                        AddBill().addNewBil(
                          uidDriver: widget.uidDrivar,
                          nameFarmar: widget.nameFarmar,
                          uidFarmar: widget.uidFarmar,
                          typeDate: widget.typeDate,
                          typePuy: "كاش",
                          conts: widget.conts,
                          price: widget.price,
                          allPrice: widget.allPrice,
                          numberCachMachen: "لايوجد",
                          cach: widget.allPrice,
                          context: context,
                          numberDriver: widget.numberFarm,
                        );
                        Navigator.pop(context);
                      },
                      child: const Text("كاش", style: TextStyle(fontSize: 22))),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(buttons)),
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BillCredit(
                                allPrice: widget.allPrice,
                                typePay: "شبكة",
                                uidFarmar: widget.uidFarmar,
                                nameFarmar: widget.nameFarmar,
                                uidDrivar: widget.uidDrivar,
                                numberFarm: widget.numberFarm,
                                price: widget.price,
                                conts: widget.conts,
                                typeDate: widget.typeDate,
                              );
                            });
                      },
                      child: const Text("شبكة", style: TextStyle(fontSize: 22)))
                ]),
                Column(children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(buttons)),
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BillCredit(
                                allPrice: widget.allPrice,
                                typePay: "دمج",
                                uidFarmar: widget.uidFarmar,
                                nameFarmar: widget.nameFarmar,
                                uidDrivar: widget.uidDrivar,
                                numberFarm: widget.numberFarm,
                                price: widget.price,
                                conts: widget.conts,
                                typeDate: widget.typeDate,
                              );
                            });
                      },
                      child: const Text("دمج", style: TextStyle(fontSize: 22))),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(buttons)),
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddBillDelar(
                                allPrice: widget.price * widget.conts,
                                uidFarmar: widget.uidFarmar,
                                nameFarmar: widget.nameFarmar,
                                uidDrivar: widget.uidDrivar,
                                numberFarm: widget.numberFarm,
                                price: widget.price,
                                conts: widget.conts,
                                typeDate: widget.typeDate,
                              );
                            });
                      },
                      child: const Text("تاجر", style: TextStyle(fontSize: 22)))
                ])
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.all(4),
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text("المجموع : ${widget.conts * widget.price}",
                        style: const TextStyle(fontSize: 18))),
                const SizedBox(width: 40)
              ])
            ])));
  }
}
