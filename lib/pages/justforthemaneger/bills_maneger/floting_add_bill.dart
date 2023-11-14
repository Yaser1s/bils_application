import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test10/pages/justforthemaneger/bills_maneger/add_bill.dart';
import 'package:test10/shared/colors.dart';

class FlotingAddBillButton extends StatefulWidget {
  const FlotingAddBillButton({super.key});

  @override
  State<FlotingAddBillButton> createState() => _FlotingAddBillButtonState();
}

class _FlotingAddBillButtonState extends State<FlotingAddBillButton> {
  final credential = FirebaseAuth.instance.currentUser;
  final searchFarmsCnt = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    searchFarmsCnt.addListener(showUser);
  }

  showUser() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 150),
        child: Scaffold(
            backgroundColor: backgrond,
            appBar: AppBar(
                backgroundColor: appbarcolor,
                title: Container(
                    margin: const EdgeInsets.all(20),
                    child: TextFormField(
                        controller: searchFarmsCnt,
                        decoration: InputDecoration(
                            label: Text("اكتب رقم المزرعة هنا",
                                style: TextStyle(
                                    fontSize: 23, color: Colors.grey[800])))))),
            body: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('Drivers')
                    .where("DriverNumber", isEqualTo: searchFarmsCnt.text)
                    .get(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                        child: Column(children: [
                      SizedBox(height: 100),
                      Text("Something went wrong")
                    ]));
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return snapshot.data!.docs[index]["NameFarmar"] !=
                                  null
                              ? ListTile(
                                  title: ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  backgrond)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AddBillNew(
                                                  nameFarmar:
                                                      snapshot.data!.docs[index]
                                                          ["NameFarmar"],
                                                  uidFarmar: snapshot.data!
                                                      .docs[index]["UidFarm"],
                                                  uidDriver: snapshot.data!
                                                      .docs[index]["UidDriver"],
                                                  numberFarm:
                                                      snapshot.data!.docs[index]
                                                          ["DriverNumber"]);
                                            });
                                      },
                                      child: Column(children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  "#${snapshot.data.docs[index]["DriverNumber"]} : رقم المزرعة",
                                                  style: TextStyle(
                                                      fontSize: 23,
                                                      color: Colors.grey[800]))
                                            ]),
                                        const Divider(thickness: 1, height: 20),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  "${snapshot.data.docs[index]["NameFarmar"]} : صاحب المزرعة",
                                                  style: TextStyle(
                                                      fontSize: 23,
                                                      color: Colors.grey[800]))
                                            ])
                                      ])))
                              : const Center(
                                  child: Column(children: [
                                  Text("لايوجد سائق بهذا الرقم")
                                ]));
                        });
                  }
                  return Center(
                      child:
                          CircularProgressIndicator(color: Colors.grey[800]));
                })));
  }
}
