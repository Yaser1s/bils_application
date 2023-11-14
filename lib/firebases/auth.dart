import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test10/pages/bill.dart';
import 'package:test10/models/user.dart';
import 'package:test10/shared/snackbar.dart';

//

class AuthMethod {
  //

  registor(
      {required context,
      required email,
      required password,
      required name,
      required phoneNumber}) async {
    //
    // String message = "ERROR => Not starting the code";

    try {
      //          هذا السطرين لانشاء الحساب
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      CollectionReference tradors =
          FirebaseFirestore.instance.collection('Tradors');

      UserData trador = UserData(
          email: email,
          password: password,
          name: name,
          phoneNumber: phoneNumber,
          uid: credential.user!.uid);

      tradors.doc(credential.user!.uid).set(trador.convert2Map());

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, "الرقم السري ضعيف جدا");
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, "الايميل المدخل لقد تم استخدامه من قبل");
      } else {
        showSnackBar(context, "ERROR - حاول في وقت لاحق");
      }
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  //

  signIn({required emaill, required passwordd, required context}) async {
    //

    // final credential = FirebaseAuth.instance.currentUser;
    // DocumentSnapshot trador = await FirebaseFirestore.instance
    //     .collection('Tradors')
    //     .doc(credential!.uid)
    //     .get();
    // bool canManeg = trador["Maneg"];
    //

    try {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                // canManeg ? const Mobile() :
                const BillsPage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, "الايميل غير موجود");
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, "الايميل او الرمز المدخل خطأ");
      }
    }
  }

  // functoin to get user details from Firestore (Database)
  Future<UserData> getUserDetails() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('Tradors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return UserData.convertSnap2Model(snap);
  }
}
