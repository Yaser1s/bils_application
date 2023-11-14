// ignore_for_file: use_build_context_synchronously, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test10/firebases/firebase_farms.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/shared/custom_textfield.dart';
import 'package:test10/shared/strings.dart';

class FlotingAddFarms extends StatefulWidget {
  const FlotingAddFarms({super.key});

  @override
  State<FlotingAddFarms> createState() => _FlotingAddFarmsState();
}

class _FlotingAddFarmsState extends State<FlotingAddFarms> {
  final whowInChargeCnt = TextEditingController();

  final whowInChargePhoneNumberCnt = TextEditingController();

  bool isLoding = false;
  bool isEmpty = false;

  isempty() {
    setState(() {
      isEmpty = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(40, 190, 40, 230),
                    child: Scaffold(
                        backgroundColor: backgrond,
                        body: SingleChildScrollView(
                            child: Column(children: [
                          Container(
                              margin: const EdgeInsets.all(20),
                              child: Column(children: [
                                TextFormField(
                                    validator: (value) {
                                      return value!.isEmpty
                                          ? enterNameFarmar
                                          : null;
                                    },
                                    controller: whowInChargeCnt,
                                    textInputAction: TextInputAction.next,
                                    textAlign: TextAlign.right,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.name,
                                    decoration: decorationTextfield.copyWith(
                                        hintText: enterNameFarmar,
                                        icon: const Icon(Icons.person,
                                            color: iconsColor, size: 19))),
                                const SizedBox(height: 30),
                                TextFormField(
                                    validator: (number) {
                                      return number!.contains(RegExp(r'.{8,}'))
                                          ? null
                                          : enterPhoneNumberTrue;
                                    },
                                    controller: whowInChargePhoneNumberCnt,
                                    textInputAction: TextInputAction.done,
                                    textAlign: TextAlign.right,
                                    maxLength: 8,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.phone,
                                    decoration: decorationTextfield.copyWith(
                                        hintText: phoneNumber,
                                        icon: const Icon(Icons.phone,
                                            color: iconsColor, size: 19))),
                                const SizedBox(height: 30)
                              ])),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(buttons)),
                                    onPressed: () async {
                                      setState(() {
                                        isLoding = true;
                                      });
                                      if (whowInChargeCnt.text.isEmpty ||
                                          whowInChargePhoneNumberCnt
                                              .text.isEmpty) {
                                        isempty();
                                      } else {
                                        await AddFarms().addFarms(
                                            context: context,
                                            whowInCharge: whowInChargeCnt.text,
                                            whowInChargePhoneNumber:
                                                "05${whowInChargePhoneNumberCnt.text}");
                                      }

                                      setState(() {
                                        isLoding = false;
                                      });
                                    },
                                    child: isLoding
                                        ? CircularProgressIndicator(
                                            color: Colors.white)
                                        : Text("اضافة مزرعة"))
                              ])
                        ]))));
              });
        },
        backgroundColor: flotingAddColor,
        child: const Icon(Icons.add));
  }
}
