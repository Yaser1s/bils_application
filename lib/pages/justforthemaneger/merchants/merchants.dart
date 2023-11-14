// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test10/pages/drawer/drawer.dart';
import 'package:test10/pages/justforthemaneger/merchants/add_merchants.dart';
import 'package:test10/shared/colors.dart';

class Merchants extends StatefulWidget {
  const Merchants({Key? key}) : super(key: key);

  @override
  State<Merchants> createState() => _MerchantsState();
}

class _MerchantsState extends State<Merchants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
          backgroundColor: appbarcolor,
          centerTitle: true,
          title: Text("التجار", style: TextStyle(color: textColorswhite))),
      backgroundColor: backgrond,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddNewMerchants();
              });
        },
        backgroundColor: flotingAddColor,
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Delars').snapshots(),
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
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> allDelars =
                  document.data()! as Map<String, dynamic>;
              return GestureDetector(
                  onTap: () {},
                  child: allDelars["Name"] != null
                      ? Container(
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
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(allDelars["Name"],
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: fontWeighttext,
                                                  color: textColorsBlack)),
                                        ],
                                      ),
                                      const Text(" : اسم التاجر",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: fontWeighttext,
                                              color: textColorsBlack))
                                    ]),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(allDelars["NumberPhone"],
                                                    textAlign: TextAlign.end,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            fontWeighttext,
                                                        color: textColorsBlack))
                                              ]),
                                          const Text(" : رقم التاجر",
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: fontWeighttext,
                                                  color: textColorsBlack))
                                        ]),
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("${allDelars["Bills"].length}",
                                                textAlign: TextAlign.end,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: fontWeighttext,
                                                    color: textColorsBlack))
                                          ]),
                                      const Text(" : عدد الفواتير",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: fontWeighttext,
                                              color: textColorsBlack))
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "${allDelars["HowMuchHeOweUs"]}",
                                                      textAlign: TextAlign.end,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              fontWeighttext,
                                                          color:
                                                              textColorsBlack))
                                                ]),
                                            const Text(" : عليه",
                                                style: TextStyle(
                                                    fontSize: 23,
                                                    fontWeight: fontWeighttext,
                                                    color: textColorsBlack))
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "${allDelars["HowMuchOweHim"]}",
                                                      textAlign: TextAlign.end,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              fontWeighttext,
                                                          color:
                                                              textColorsBlack))
                                                ]),
                                            const Text(" : له",
                                                style: TextStyle(
                                                    fontSize: 23,
                                                    fontWeight: fontWeighttext,
                                                    color: textColorsBlack))
                                          ])
                                    ])
                              ]))
                      : Center(
                          child: Column(
                            children: const [Text("لايوجد بيانات حتى الان")],
                          ),
                        ));
            }).toList());
          }),
    );
  }
}
