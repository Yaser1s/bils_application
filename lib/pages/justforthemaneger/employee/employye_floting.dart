// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test10/pages/justforthemaneger/employee/confirm_employee.dart';
import 'package:test10/shared/colors.dart';

class EmployeeFloting extends StatefulWidget {
  const EmployeeFloting({super.key});

  @override
  State<EmployeeFloting> createState() => _EmployeeFlotingState();
}

class _EmployeeFlotingState extends State<EmployeeFloting> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 130, top: 70),
      child: Scaffold(
          backgroundColor: backgrond,
          appBar: AppBar(backgroundColor: appbarcolor),
          body: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Tradors')
                  .where("State", isEqualTo: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child:
                          CircularProgressIndicator(color: Colors.grey[800]));
                }

                return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> allEmployess =
                      document.data()! as Map<String, dynamic>;
                  return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return confirmEmployee(data: allEmployess);
                            });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(55, 0, 0, 0),
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                    Text(allEmployess["Name"],
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            fontSize: 23,
                                            fontWeight: fontWeighttext,
                                            color: textColorsBlack)),
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(allEmployess["NumberOfUser"],
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
                                    ]),
                              ])));
                }).toList());
              })),
    );
  }
}
