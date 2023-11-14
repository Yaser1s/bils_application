// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test10/pages/drawer/forget_pass.dart';
import 'package:test10/shared/colors.dart';

// ignore: camel_case_types
class tradorData2 extends StatelessWidget {
  final String documentId;

  const tradorData2({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Tradors');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Card(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Card(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(" : البريد الاكتروني",
                              style: TextStyle(fontSize: 30)),
                          const Divider(thickness: 1, height: 20),
                          Text(data["Email"],
                              style: const TextStyle(fontSize: 20)),
                          SizedBox(height: 20)
                        ],
                      )),
                  Card(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Divider(thickness: 1, height: 20),
                      Text("  ${data["UserName"]}  ",
                          style: const TextStyle(fontSize: 28)),
                      Text(data["Type"], style: const TextStyle(fontSize: 28)),
                      const Text(" : الوظيفة", style: TextStyle(fontSize: 30)),
                      SizedBox(height: 20)
                    ],
                  )),
                  Card(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Divider(thickness: 1, height: 20),
                      Text("${data["Bills"].length}",
                          style: const TextStyle(fontSize: 28)),
                      const Text(" : عدد الفواتير",
                          style: TextStyle(fontSize: 30)),
                      SizedBox(height: 20)
                    ],
                  )),
                  SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(buttons)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ForgetPass2(emaill: data["Email"]),
                            ),
                          );
                        },
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, left: 30, right: 30),
                            child: const Text(
                              "لتغيير كلمة المرور",
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                      SizedBox(width: 30)
                    ],
                  ),
                ],
              ),
            ),
          );
        }

        return Center(
            child: CircularProgressIndicator(color: Colors.grey[800]));
      },
    );
  }
}
