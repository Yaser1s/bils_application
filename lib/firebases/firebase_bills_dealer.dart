// ignore_for_file: empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test10/models/bill_delars.dart';
import 'package:test10/shared/snackbar.dart';
import 'package:uuid/uuid.dart';

class AddBillDelars {
  //

  addNewBilDelars(
      {required uidDriver,
      required oneUs,
      required uidDelars,
      required nameFarmar,
      required numberDriver,
      required uidFarmar,
      required typeDate,
      required typePuy,
      required conts,
      required price,
      required allPrice,
      required nameDelars,
      required context}) async {
    String idBill = const Uuid().v1();
    String message = "ERROR => Not starting the code";
    var inst = FirebaseFirestore.instance;

    try {
      CollectionReference bills = inst.collection('Bills');

      //

      CollectionReference tradors = inst.collection('Tradors');

      //

      CollectionReference delars = inst.collection('Delars');

      //

      CollectionReference driver = inst.collection('Drivers');

      //

      message = "ERROR => erroe hereeeeeeee";
      AdedBillDelars bill = AdedBillDelars(
        uidDriver: uidDriver,
        uidDelar: uidDelars,
        uidBill: idBill,
        nameFarmar: nameFarmar,
        numberDriver: numberDriver,
        uidFarmar: uidFarmar,
        typePuy: typePuy,
        typeDate: typeDate,
        counts: conts,
        price: price,
        allPrice: allPrice,
        nameDelars: nameDelars,
        uidTrador: FirebaseAuth.instance.currentUser!.uid,
      );
      message = "ERROR => erroe ";
      bills.doc(idBill).set(bill.convert2Map());
      tradors.doc(FirebaseAuth.instance.currentUser!.uid).update({"Bills": FieldValue.arrayUnion([idBill])});
      delars.doc(uidDelars).update({"Bills": FieldValue.arrayUnion([idBill]),"HowMuchHeOweUs": oneUs + allPrice});
      driver.doc(uidDriver).update({"Bills": FieldValue.arrayUnion([idBill])});
      message = " تم اضافة الفاتورة";
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    showSnackBar(context, message);
  }
}
