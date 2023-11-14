// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/shared/strings.dart';

class GetDataUsers extends StatefulWidget {
  final String documentId;

  const GetDataUsers({Key? key, required this.documentId}) : super(key: key);

  @override
  State<GetDataUsers> createState() => _GetDataUsersState();
}

class _GetDataUsersState extends State<GetDataUsers> {
  CollectionReference users = FirebaseFirestore.instance.collection('usersssS');
  final cnt = TextEditingController();
  final credential = FirebaseAuth.instance.currentUser;

  //
  //

  myDialog(Map data, dynamic mykey, String hintText) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11)),
              child: Container(
                  padding: EdgeInsets.all(22),
                  height: 230,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          " : $hintText",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        )),
                        TextField(
                            controller: cnt,
                            maxLength: 20,
                            decoration:
                                InputDecoration(hintText: "  ${data[mykey]}")),
                        SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    users
                                        .doc(credential!.uid)
                                        .update({mykey: cnt.text});
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(edit,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(cancel,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
                            ])
                      ])));
        });
  }

  @override
  void dispose() {
    cnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            children: [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: buttons,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            myDialog(data, 'UserName', userName);
                          },
                          icon: Icon(Icons.edit,size: 19)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(data["UserName"],
                              style: TextStyle(fontSize: 15)),
                          Text(" : $userName", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 11),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: buttons,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            myDialog(data, 'Name', name);
                          },
                          icon: Icon(Icons.edit,size: 19)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(data["Name"], style: TextStyle(fontSize: 15)),
                          Text(" : $name",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 11),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  color: buttons,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  myDialog(data, 'NumberOfUser', phoneNumber);
                                },
                                icon: Icon(Icons.edit,size: 19)),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(data["NumberOfUser"],
                                      style: TextStyle(fontSize: 15)),
                                  Text(" : $phoneNumber",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500))
                                ])
                          ]))),
              // Card(
              //   margin: EdgeInsets.symmetric(horizontal: 10),
              //   color: buttons,
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 20),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Text(data["Type"], style: TextStyle(fontSize: 15)),
              //         Text(" : $careerNamed",style: TextStyle(
              //                 fontSize: 15, fontWeight: FontWeight.w500)),
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 11),
            ],
          );
        }

        return SizedBox(
            width: double.infinity,
            height: 150,
            child: Center(
                child: CircularProgressIndicator(color: Colors.grey[700])));
      },
    );
  }
}
