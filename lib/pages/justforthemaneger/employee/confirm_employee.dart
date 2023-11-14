// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/shared/custom_textfield.dart';

class confirmEmployee extends StatefulWidget {
  final dynamic data;
  const confirmEmployee({super.key, required this.data});

  @override
  State<confirmEmployee> createState() => _confirmEmployeeState();
}

class _confirmEmployeeState extends State<confirmEmployee> {
  //

  final userName = TextEditingController();

  bool isLoding = false;

  clickOnRigister() async {
    setState(() {
      isLoding = true;
    });

    await FirebaseFirestore.instance
        .collection('Tradors')
        .doc(widget.data["uid"])
        .update({"State": true, "UserName": "م${userName.text}", "Bills": []});

    setState(() {
      isLoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 160, top: 140),
        child: Scaffold(
            backgroundColor: backgrond,
            appBar: AppBar(backgroundColor: appbarcolor),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(55, 0, 0, 0),
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(" : اسم الموظف",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: fontWeighttext,
                                      color: textColorsBlack))
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(widget.data["Name"],
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: fontWeighttext,
                                      color: textColorsBlack))
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(widget.data["NumberOfUser"],
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: fontWeighttext,
                                            color: textColorsBlack))
                                  ]),
                              const Text(" : رقم الموظف",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: fontWeighttext,
                                      color: textColorsBlack))
                            ])
                      ])),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(55, 0, 0, 0),
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Column(children: [
                        const SizedBox(height: 20),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.number,
                                controller: userName,
                                decoration: decorationTextfield.copyWith(
                                    hintText: "رقم المستخدم :",
                                    icon: Icon(Icons.person,
                                        color: Colors.grey[700], size: 19)))),
                        const SizedBox(height: 20),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: ElevatedButton(
                                onPressed: () async {
                                  await clickOnRigister();
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(buttons),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(27)))),
                                child: SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: Center(
                                        child: isLoding
                                            ? CircularProgressIndicator(
                                                color: Colors.white)
                                            : Text("اعتماد المستخدم",
                                                style: TextStyle(
                                                    fontSize: 24)))))),
                        const SizedBox(height: 10),
                      ]))
                ])));
  }
}
