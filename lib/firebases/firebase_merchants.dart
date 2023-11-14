import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test10/models/merchants.dart';
import 'package:test10/shared/snackbar.dart';
import 'package:uuid/uuid.dart';

// ignore: camel_case_types
class addMerchantsss {
  //

  addMerchants(
      {required typeDelar,
      required numberPhone,
      required name,
      required howMuchOweHim,
      required context}) async {
    String idMerchants = const Uuid().v1();
    String message = "ERROR => Not starting the code";
    String uidTrador = FirebaseAuth.instance.currentUser!.uid;
    try {
      CollectionReference merchantsss =
          FirebaseFirestore.instance.collection('Delars');

      message = "ERROR => erroe hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee";

      AddNewMerchants merchantss = AddNewMerchants(
          uidMerchants: idMerchants,
          typeDelar: typeDelar,
          dateUpload: DateTime.now(),
          numberPhone: numberPhone,
          name: name,
          howMuchOweHim: howMuchOweHim,
          whowUplodetUid: uidTrador);
      message = "ERROR => erroe ";

      merchantsss.doc(idMerchants).set(merchantss.convert2Map());

      message = " تم تسجيل التاجر ";
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    showSnackBar(context, message);
  }
}
