// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test10/shared/colors.dart';

class EditEmployee extends StatefulWidget {
  final dynamic data;
  const EditEmployee({super.key, required this.data});

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  bool canAddBill = true;
  bool canEditEmployee = false;
  bool canEditDelars = false;
  bool canEditFarms = false;
  bool heIsTheManegare = false;

  //

  final userName = TextEditingController();

  changeText() async {
    DocumentSnapshot trador = await FirebaseFirestore.instance
        .collection('Tradors')
        .doc(widget.data["uid"])
        .get();
    setState(() {
      canAddBill = trador["State"];
      canEditEmployee = trador["Maneg"];
      canEditDelars = trador["DelarsChanges"];
      canEditFarms = trador["AddFarms"];
      heIsTheManegare = trador["ManegEmployee"];
    });
  }

  bool isLoding1 = false;
  bool isLoding2 = false;
  bool isLoding3 = false;
  bool isLoding4 = false;
  bool isLoding5 = false;
  bool isLoding6 = false;

  closeUser() async {
    setState(() {
      isLoding1 = true;
    });

    await FirebaseFirestore.instance
        .collection('Tradors')
        .doc(widget.data["uid"])
        .update({
      "State": false,
      "Maneg": false,
      "DelarsChanges": false,
      "AddFarms": false,
      "ManegEmployee": false,
      "Type": "محاسب"
    });

    setState(() {
      isLoding1 = false;
    });
  }

  //

  giveMangersEditing() async {
    setState(() {
      isLoding2 = true;
    });
    bool can = widget.data["Maneg"];
    await FirebaseFirestore.instance
        .collection('Tradors')
        .doc(widget.data["uid"])
        .update({"Maneg": !can});

    setState(() {
      isLoding2 = false;
    });
  }

  //

  giveDelarsChanges() async {
    setState(() {
      isLoding3 = true;
    });
    bool can = widget.data["DelarsChanges"];
    await FirebaseFirestore.instance
        .collection('Tradors')
        .doc(widget.data["uid"])
        .update({"DelarsChanges": !can});

    setState(() {
      isLoding3 = false;
    });
  }

  //

  giveEdtingFarms() async {
    setState(() {
      isLoding4 = true;
    });
    bool can = widget.data["AddFarms"];
    await FirebaseFirestore.instance
        .collection('Tradors')
        .doc(widget.data["uid"])
        .update({"AddFarms": !can});

    setState(() {
      isLoding4 = false;
    });
  }

  //

  giveEdtingEmployee() async {
    setState(() {
      isLoding5 = true;
    });
    var h1 = await FirebaseFirestore.instance
        .collection('Tradors')
        .doc(widget.data["uid"])
        .get();
    bool can = h1["ManegEmployee"];
    can
        ? await FirebaseFirestore.instance
            .collection('Tradors')
            .doc(widget.data["uid"])
            .update({"ManegEmployee": true, "Type": "مدير"})
        : await FirebaseFirestore.instance
            .collection('Tradors')
            .doc(widget.data["uid"])
            .update({"ManegEmployee": false, "Type": "محاسب"});

    setState(() {
      isLoding5 = false;
    });
  }

  bool theManegar = false;
  editing() async {
    DocumentSnapshot trador = await FirebaseFirestore.instance
        .collection('Tradors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      trador["Type"] == "محاسب" ? theManegar = true : theManegar = false;
    });
  }
  //

  closeAcaount() async {
    setState(() {
      isLoding6 = true;
    });
    await FirebaseFirestore.instance
        .collection('Tradors')
        .doc(widget.data["uid"])
        .update({"Cach": 0.0});

    setState(() {
      isLoding6 = false;
    });
  }

  @override
  void initState() {
    editing();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: theManegar
            ? EdgeInsets.only()
            : EdgeInsets.only(bottom: 90, top: 100),
        child: Scaffold(
            backgroundColor: backgrond,
            appBar: AppBar(
                backgroundColor: appbarcolor,
                title: Text(
                    theManegar ? "تعديل بيانات الموظف" : "تصفير بيانات الموظف"),
                centerTitle: true),
            body: SingleChildScrollView(
                child: Column(children: [
              Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(55, 0, 0, 0),
                      borderRadius: BorderRadius.circular(10)),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(" : اسم الموظف",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: fontWeighttext,
                                  color: textColorsBlack))
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(widget.data["Name"],
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontSize: 23,
                              fontWeight: fontWeighttext,
                              color: textColorsBlack))
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.data["NumberOfUser"],
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: fontWeighttext,
                                    color: textColorsBlack))
                          ]),
                      const Text(" : رقم الموظف",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: fontWeighttext,
                              color: textColorsBlack))
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${widget.data["Bills"].length}",
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: fontWeighttext,
                                    color: textColorsBlack))
                          ]),
                      const Text(" : عدد الفواتير",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: fontWeighttext,
                              color: textColorsBlack))
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${widget.data["Cach"]}",
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: fontWeighttext,
                                    color: textColorsBlack))
                          ]),
                      const Text(" : الكاش",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: fontWeighttext,
                              color: textColorsBlack))
                    ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 60),
                          Text(widget.data["UserName"],
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: fontWeighttext,
                                  color: textColorsBlack)),
                          Text(widget.data["Type"],
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: fontWeighttext,
                                  color: textColorsBlack)),
                          const SizedBox(width: 10)
                        ]),
                    theManegar
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                canEditEmployee
                                    ? Text("والتعديل على بيانات الموظفين ",
                                        style: TextStyle(fontSize: 13))
                                    : SizedBox(),
                                canAddBill
                                    ? Text("كتابة العقود ",
                                        style: TextStyle(fontSize: 13))
                                    : SizedBox(),
                                Text("يستطيع ", style: TextStyle(fontSize: 13)),
                              ])
                        : SizedBox(),
                    theManegar
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                canEditDelars
                                    ? Text("والتعديل على بيانات التجار ",
                                        style: TextStyle(fontSize: 12))
                                    : SizedBox(),
                                canEditFarms
                                    ? Text("والتعديل على بيانات المزارع",
                                        style: TextStyle(fontSize: 12))
                                    : SizedBox()
                              ])
                        : SizedBox()
                  ])),
              theManegar
                  ? Container(
                      decoration: BoxDecoration(
                          // color: const Color.fromARGB(55, 0, 0, 0),
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Column(children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: ElevatedButton(
                                onPressed: () async {
                                  closeAcaount();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(buttons),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(27)))),
                                child: SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: Center(
                                        child: isLoding6
                                            ? CircularProgressIndicator(
                                                color: Colors.white)
                                            : Text("تصفير الكاش",
                                                style: TextStyle(
                                                    fontSize: 24)))))),
                        const SizedBox(
                            height: 30,
                            child: Text("الصلاحيات",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: fontWeighttext,
                                    color: textColorsBlack))),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: ElevatedButton(
                                onPressed: () async {
                                  giveMangersEditing();
                                  await changeText();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(buttons),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(27)))),
                                child: SizedBox(
                                    height: 60,
                                    child: Center(
                                        child: isLoding2
                                            ? CircularProgressIndicator(
                                                color: Colors.white)
                                            : Text("تعديل الموظفين",
                                                style: TextStyle(
                                                    fontSize: 24)))))),
                        const SizedBox(height: 10),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: ElevatedButton(
                                onPressed: () async {
                                  giveDelarsChanges();
                                  await changeText();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(buttons),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(27)))),
                                child: SizedBox(
                                    height: 60,
                                    child: Center(
                                        child: isLoding3
                                            ? CircularProgressIndicator(
                                                color: Colors.white)
                                            : Text("تعديل التجار",
                                                style: TextStyle(
                                                    fontSize: 24)))))),
                        const SizedBox(height: 10),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: ElevatedButton(
                                onPressed: () async {
                                  giveEdtingFarms();
                                  await changeText();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(buttons),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(27)))),
                                child: SizedBox(
                                    height: 60,
                                    child: Center(
                                        child: isLoding4
                                            ? CircularProgressIndicator(
                                                color: Colors.white)
                                            : Text("تعديل المزارع",
                                                style: TextStyle(
                                                    fontSize: 24)))))),
                        const SizedBox(height: 10),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: ElevatedButton(
                                onPressed: () async {
                                  giveEdtingEmployee();
                                  await changeText();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(buttons),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(27)))),
                                child: SizedBox(
                                    height: 60,
                                    child: Center(
                                        child: isLoding5
                                            ? CircularProgressIndicator(
                                                color: Colors.white)
                                            : Text("تعديل بيانات الموظفين",
                                                style: TextStyle(
                                                    fontSize: 24)))))),
                        const SizedBox(height: 20),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: ElevatedButton(
                                onPressed: () async {
                                  closeUser();
                                  await changeText();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(buttons),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(27)))),
                                child: SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: Center(
                                        child: isLoding1
                                            ? CircularProgressIndicator(
                                                color: Colors.white)
                                            : Text("ايقاف المستخدم",
                                                style: TextStyle(
                                                    fontSize: 24)))))),
                        const SizedBox(height: 10),
                      ]))
                  : Container(
                      decoration: BoxDecoration(
                          // color: const Color.fromARGB(55, 0, 0, 0),
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ElevatedButton(
                              onPressed: () async {
                                closeAcaount();
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(buttons),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(27)))),
                              child: SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: Center(
                                      child: isLoding6
                                          ? CircularProgressIndicator(
                                              color: Colors.white)
                                          : Text("تصفير الكاش",
                                              style:
                                                  TextStyle(fontSize: 24)))))))
            ]))));
  }
}
