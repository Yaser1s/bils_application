import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test10/pages/drawer/drawer.dart';
import 'package:test10/pages/justforthemaneger/bills_maneger/floting_add_bill.dart';
import 'package:test10/shared/colors.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({super.key});

  @override
  State<BillsPage> createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  final credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrond,
        appBar: AppBar(
            title: const Text("الفواتير",
                style: TextStyle(color: textColorswhite)),
            centerTitle: true,
            backgroundColor: appbarcolor),
        drawer: const myDrawer(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: flotingAddColor,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const FlotingAddBillButton();
                  });
            },
            child: const Icon(Icons.add)),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Bills')
                .where("uidTrador", isEqualTo: credential!.uid)
                .snapshots(),
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
                return GestureDetector(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(55, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              "${allBills["NumberDriver"]} : الرقم",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: textColorsBlack))
                                        ]),
                                    Row(children: [
                                      Text(
                                          "اسم المزارع : ${allBills["NameFarmar"]}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: textColorsBlack))
                                    ])
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              "المجموع : ${allBills["AllPrice"]}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: textColorsBlack))
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              "نوع التمر : ${allBills["TypeDate"]}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: textColorsBlack))
                                        ])
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text("${allBills["Counts"]} : العدد",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: textColorsBlack))
                                        ]),
                                    Row(children: [
                                      Text("السعر : ${allBills["Price"]}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: textColorsBlack))
                                    ])
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              "طريقة الحساب : ${allBills["TypePuy"]}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: textColorsBlack))
                                        ]),
                                  ]),
                              if (allBills["TypePuy"] == "دمج")
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          "شبكة رقم : ${allBills["NumberCachMachen"]}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: textColorsBlack)),
                                      Text("الكاش : ${allBills["Cach"]}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: textColorsBlack))
                                    ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("م90",
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: textColorsBlack))
                                              ]),
                                        ]),
                                    if (allBills["TypePuy"] == "شبكة")
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                                "شبكة رقم : ${allBills["NumberCachMachen"]}",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: textColorsBlack))
                                          ]),
                                    Row(children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            DateFormat('a').format(
                                                        allBills["DateTime"]
                                                            .toDate()) ==
                                                    "AM"
                                                ? Text(
                                                    DateFormat('hh:mmص').format(
                                                        allBills["DateTime"]
                                                            .toDate()),
                                                    textAlign: TextAlign.end,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        color: textColorsBlack))
                                                : Text(
                                                    DateFormat('hh:mmم').format(
                                                        allBills["DateTime"]
                                                            .toDate()),
                                                    textAlign: TextAlign.end,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            textColorsBlack)),
                                          ]),
                                    ])
                                  ]),
                            ])));
              }).toList());
            }));
  }
}
