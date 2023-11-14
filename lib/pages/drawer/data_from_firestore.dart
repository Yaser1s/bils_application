import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test10/pages/drawer/profile_page.dart';

// ignore: camel_case_types
class tradorData extends StatelessWidget {
  final String documentId;

  const tradorData({super.key, required this.documentId});

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
          return Column(
            children: [
              UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/background.png"),
                          fit: BoxFit.cover)),
                  currentAccountPicture: const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage("assets/img/person.jpg")),
                  accountEmail: Text(data["Email"]),
                  accountName: Text(data["Name"],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)))),
              ListTile(
                  title: const Text("الصفحة الرئيسية"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const Mobile(),
                    //   ),
                    // );
                  }),
              ListTile(
                  title: const Text("الصفحة الشخصية"),
                  leading: const Icon(Icons.person),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  }),
            ],
          );
        }

        return const Text("loading");
      },
    );
  }
}
