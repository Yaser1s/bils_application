// ignore_for_file: unused_local_variable, unused_import, empty_catches, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test10/models/bill.dart';
import 'package:test10/models/farms.dart';
import 'package:test10/shared/snackbar.dart';
import 'package:uuid/uuid.dart';

class AddFarms {
  //

  addFarms({
    required context,
    required whowInCharge,
    required whowInChargePhoneNumber,
  }) async {
    //
    //    المسج هذا لاصطياد الاخطاء
    String message = "ERROR => erroe 1";
    try {
      String uidFArm = Uuid().v1();
      //        هذا السطر لتعريف قاعدة البيانات في السيرفر
      CollectionReference farms =
          FirebaseFirestore.instance.collection('Farms');

      message = "ERROR => erroe 2";

      AddFarm farmm = AddFarm(
          uidFarm: uidFArm,
          dateUpload: DateTime.now(),
          whowInCharge: whowInCharge,
          whowInChargePhoneNumber: whowInChargePhoneNumber,
          whowUplodetUid: FirebaseAuth.instance.currentUser!.uid);

      message = "ERROR => erroe 3";

      // هذا السطر لرفع البيانات للسيرفير
      // convert2Map هذا لتحويل البيانات الى ماب ليقبلها السيرفر
      farms.doc(uidFArm).set(farmm.convert2Map());

      message = " Done";

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString());
    } catch (err) {
      showSnackBar(context, err.toString());
    }
    showSnackBar(context, message);
  }
}

class AddDriver {
  //

  addDriver({
    required context,
    required uidFarm,
    required nameFarmar,
    required driverName,
    required driverNumber,
    required driverPhoneNumber,
  }) async {
    //    المسج هذا لاصطياد الاخطاء
    String message = "ERROR => erroe 1";
    try {
      String uidDriver = Uuid().v1();
      //        هذا السطر لتعريف قاعدة البيانات في السيرفر
      CollectionReference drivers =
          FirebaseFirestore.instance.collection('Drivers');

      //

      CollectionReference farms =
          FirebaseFirestore.instance.collection('Farms');

      //

      message = "ERROR => erroe 2";

      AddNewDriver driverr = AddNewDriver(
        nameFarmar: nameFarmar,
        uidFarm: uidFarm,
        uidDriver: uidDriver,
        dateUpload: DateTime.now(),
        driverName: driverName,
        driverNumber: driverNumber,
        driverPhoneNumber: driverPhoneNumber,
        whowUplodetUid: FirebaseAuth.instance.currentUser!.uid,
      );

      message = "ERROR => erroe 3";

      // هذا السطر لرفع البيانات للسيرفير
      // convert2Map هذا لتحويل البيانات الى ماب ليقبلها السيرفر
      drivers.doc(uidDriver).set(driverr.convert2Map());
      farms.doc(uidFarm).update({
        "Drivers": FieldValue.arrayUnion([uidDriver])
      });
      message = " تم اضافة السائق";

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString());
    } catch (err) {
      showSnackBar(context, err.toString());
    }
    showSnackBar(context, message);
  }
}
