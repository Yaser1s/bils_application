// ignore_for_file: unused_import, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';
import 'package:test10/pages/drawer/drawer.dart';
import 'package:test10/pages/justforthemaneger/bills_maneger/bills_return.dart';
import 'package:test10/pages/justforthemaneger/farms_maneger/farms.dart';
import 'package:test10/pages/justforthemaneger/bills_maneger/floting_add_bill.dart';
import 'package:test10/firebases/firebase_bills.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/models/bill.dart';
import 'package:test10/shared/strings.dart';

class BillsForManegar extends StatefulWidget {
  const BillsForManegar({super.key});

  @override
  State<BillsForManegar> createState() => _BillsForManegarState();
}

class _BillsForManegarState extends State<BillsForManegar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrond,
        appBar: AppBar(
            title: Text("الفواتير", style: TextStyle(color: textColorswhite)),
            centerTitle: true,
            backgroundColor: appbarcolor),
        drawer: const myDrawer(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: flotingAddColor,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FlotingAddBillButton();
                  });
            },
            child: const Icon(Icons.add)),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Bills').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(color: Colors.grey[800]));
              }

              return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> allBills =
                    document.data()! as Map<String, dynamic>;
                return BillsReturn(data: allBills);
              }).toList());
            }));
  }
}
