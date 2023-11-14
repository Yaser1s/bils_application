// ignore_for_file: empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test10/models/bill.dart';
import 'package:test10/shared/snackbar.dart';
import 'package:uuid/uuid.dart';

class AddBill {
  //

  addNewBil(
      {required uidDriver,
      required nameFarmar,
      required numberDriver,
      required uidFarmar,
      required typeDate,
      required typePuy,
      required conts,
      required price,
      required allPrice,
      required numberCachMachen,
      required cach,
      required context}) async {
    //

    String idBill = const Uuid().v1();
    String message = "فيه خطأ";
    try {
      FirebaseFirestore inst = FirebaseFirestore.instance;

      //

      CollectionReference bills = inst.collection('Bills');

      //

      CollectionReference tradors = inst.collection('Tradors');

      //

      CollectionReference driver = inst.collection('Drivers');

      //

      CollectionReference farms = inst.collection('Farms');

      //
      String trador = FirebaseAuth.instance.currentUser!.uid;
      AdedBill bill = AdedBill(
        uidDriver: uidDriver,
        uidBill: idBill,
        nameFarmar: nameFarmar,
        numberDriver: numberDriver,
        uidFarmar: uidFarmar,
        typePuy: typePuy,
        typeDate: typeDate,
        counts: conts,
        price: price,
        allPrice: allPrice,
        numberCachMachen: numberCachMachen,
        cach: cach,
        uidTrador: trador,
      );

      bills.doc(idBill).set(bill.convert2Map());

      tradors.doc(trador).update({
        "Cach": ++allPrice,
        "Bills": FieldValue.arrayUnion([idBill])
      });

      //

      driver.doc(uidDriver).update({
        "Cach": ++allPrice,
        "Bills": FieldValue.arrayUnion([idBill])
      });

      //

      farms.doc(uidFarmar).update({
        "Bills": FieldValue.arrayUnion([idBill])
      });

      message = " تم كتابة الفاتورة ";
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    showSnackBar(context, message);
  }
}
