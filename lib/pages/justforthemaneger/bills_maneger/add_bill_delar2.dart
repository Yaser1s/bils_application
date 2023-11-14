// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test10/firebases/firebase_bills_dealer.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/shared/snackbar.dart';

class AddBillDelar extends StatefulWidget {
  final String uidFarmar;
  final String nameFarmar;
  final String uidDrivar;
  final String numberFarm;
  final double price;
  final double conts;
  final double allPrice;
  final String typeDate;
  const AddBillDelar(
      {required this.uidFarmar,
      required this.nameFarmar,
      required this.uidDrivar,
      required this.numberFarm,
      required this.price,
      required this.conts,
      required this.allPrice,
      required this.typeDate,
      super.key});

  @override
  State<AddBillDelar> createState() => _AddBillDelarState();
}

class _AddBillDelarState extends State<AddBillDelar> {
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
                          label: Text("اكتب اسم التاجر هنا",
                              style: TextStyle(
                                  fontSize: 23, color: Colors.grey[800])))))),
          body: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('Delars')
                .where("Name", isEqualTo: searchFarmsCnt.text)
                .get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(backgrond)),
                                  onPressed: () async {
                                    if (snapshot.data!.docs[index]
                                            ["HowMuchOweHim"] >
                                        widget.allPrice +
                                            snapshot.data!.docs[index]
                                                ["HowMuchHeOweUs"]) {
                                      await AddBillDelars().addNewBilDelars(
                                          oneUs: snapshot.data!.docs[index]
                                              ["HowMuchHeOweUs"],
                                          uidDelars: snapshot.data!.docs[index]
                                              ["UidMerchants"],
                                          nameDelars: snapshot.data!.docs[index]
                                              ["Name"],
                                          uidDriver: widget.uidDrivar,
                                          nameFarmar: widget.nameFarmar,
                                          uidFarmar: widget.uidFarmar,
                                          typeDate: widget.typeDate,
                                          typePuy: "تاجر",
                                          conts: widget.conts,
                                          price: widget.price,
                                          allPrice: widget.allPrice,
                                          context: context,
                                          numberDriver: widget.numberFarm);
                                      Navigator.pop(context);
                                    } else {
                                      showSnackBar(context,
                                          "لايمكن اضافة فاتورة بهذا المبلغ لهذا التاجر");
                                    }
                                  },
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                            "#${snapshot.data!.docs[index]["Name"]}",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.grey[800])),
                                        Text(" : اسم التاجر",
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.grey[800]))
                                      ]))));
                    });
              }
              return Center(
                  child: CircularProgressIndicator(color: Colors.grey[800]));
            },
          )),
    );
  }
}
