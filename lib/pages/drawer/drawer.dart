// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test10/pages/drawer/data_from_firestore.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({super.key});

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  final credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Column(
            children: [
              tradorData(documentId: credential!.uid),
              ListTile(
                  title: const Text("تسجيل الخروج"),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: const Text("Developed by Yaser Yosef © 2023",
                style: TextStyle(fontSize: 11)),
          )
        ]));
  }
}
