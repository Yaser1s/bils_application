// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:test10/pages/drawer/data_from_firestore2.dart';

import 'package:test10/shared/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrond,
        appBar: AppBar(
          actions: [
            // TextButton.icon(
            //   onPressed: () async {
            //     await FirebaseAuth.instance.signOut();
            //     if (!mounted) return;
            //     Navigator.pop(context);
            //   },
            //   label: Text(
            //     "تسجيل الخروج",
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   icon: Icon(
            //     Icons.logout,
            //     color: Colors.white,
            //   ),
            // )
          ],
          backgroundColor: appbarcolor,
          title: Text("المعلومات الشخصية"),
        ),
        body: tradorData2(documentId: credential!.uid)
        // Padding(
        //     padding: const EdgeInsets.all(22.0),
        //     child: SingleChildScrollView(
        //       child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Column(
        //                 crossAxisAlignment: CrossAxisAlignment.end,
        //                 children: [
        //                   const SizedBox(height: 11),
        //                   Card(
        //                       margin: EdgeInsets.symmetric(horizontal: 10),
        //                       color: buttons,
        //                       child: Padding(
        //                           padding: const EdgeInsets.symmetric(
        //                               horizontal: 20, vertical: 10),
        //                           child: Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.center,
        //                               children: [
        //                                 Text("${credential!.email}",
        //                                     style: TextStyle(fontSize: 15)),
        //                                 Text(" : $email",
        //                                     style: TextStyle(fontSize: 15))
        //                               ]))),
        //                   SizedBox(height: 11),
        //                 ]),
        //             GetDataUsers(documentId: credential!.uid),
        //             const SizedBox(height: 11),
        //             Card(
        //                 margin: EdgeInsets.symmetric(horizontal: 10),
        //                 color: buttons,
        //                 child: Padding(
        //                     padding: const EdgeInsets.symmetric(
        //                         horizontal: 20, vertical: 10),
        //                     child: Row(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         children: [
        //                           Text(
        //                               DateFormat("MMMM d, y").format(
        //                                   credential!.metadata.creationTime!),
        //                               style: TextStyle(fontSize: 20)),
        //                           Text(
        //                               // textDirection: TextDirection.rtl,
        //                               " : $createdAcaount",
        //                               style: TextStyle(fontSize: 20))
        //                         ])))
        //           ]),
        //     ))

        );
  }
}
