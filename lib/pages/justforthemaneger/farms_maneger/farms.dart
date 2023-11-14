import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test10/pages/drawer/drawer.dart';
import 'package:test10/pages/justforthemaneger/farms_maneger/add_driver.dart';
import 'package:test10/pages/justforthemaneger/farms_maneger/floting%20_add_farms.dart';
import 'package:test10/shared/colors.dart';

class Farms extends StatefulWidget {
  const Farms({Key? key}) : super(key: key);

  @override
  State<Farms> createState() => _FarmsState();
}

class _FarmsState extends State<Farms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrond,
        appBar: AppBar(
            backgroundColor: appbarcolor,
            centerTitle: true,
            title: const Text("المزارع هنا",
                style: TextStyle(fontSize: 23, color: textColorswhite))),
        drawer: const myDrawer(),
        floatingActionButton: const FlotingAddFarms(),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Farms').snapshots(),
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
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddNewDriver(data: data);
                          });
                    },
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(data["WhowInCharge"],
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(fontSize: 23)),
                                    const Text(" : صاحب المزرعة",
                                        style: TextStyle(fontSize: 20))
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(children: [
                                      Text(data["WhowInChargePhoneNumber"],
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(fontSize: 16))
                                    ]),
                                    const Text(" : رقم صاحب المزرعة",
                                        style: TextStyle(fontSize: 17))
                                  ])
                            ])));
              }).toList());
            }));
  }
}
