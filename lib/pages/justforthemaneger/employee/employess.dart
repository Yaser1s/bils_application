import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test10/pages/drawer/drawer.dart';
import 'package:test10/pages/justforthemaneger/employee/employye_floting.dart';
import 'package:test10/pages/justforthemaneger/employee/return_employe.dart';
import 'package:test10/shared/colors.dart';

class Employees extends StatefulWidget {
  const Employees({Key? key}) : super(key: key);

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  double cachh = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const myDrawer(),
      appBar: AppBar(
          backgroundColor: appbarcolor,
          centerTitle: true,
          title:
              const Text("الموظفين", style: TextStyle(color: textColorswhite))),
      backgroundColor: backgrond,
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Tradors')
              .where("State", isEqualTo: true)
              .snapshots(),
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
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> allEmployess =
                  document.data()! as Map<String, dynamic>;
              return reternEmployee(allEmployess: allEmployess);
            }).toList());
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: flotingAddColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const EmployeeFloting();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
