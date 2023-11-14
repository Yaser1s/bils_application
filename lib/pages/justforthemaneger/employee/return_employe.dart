import 'package:flutter/material.dart';
import 'package:test10/pages/justforthemaneger/employee/edit_employee.dart';
import 'package:test10/shared/colors.dart';

// ignore: camel_case_types, must_be_immutable
class reternEmployee extends StatefulWidget {
  dynamic allEmployess;
  reternEmployee({super.key, required this.allEmployess});

  @override
  State<reternEmployee> createState() => _reternEmployeeState();
}

// ignore: camel_case_types
class _reternEmployeeState extends State<reternEmployee> {
  //
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return EditEmployee(data: widget.allEmployess);
              });
        },
        child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(55, 0, 0, 0),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(" : اسم الموظف",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: fontWeighttext,
                                color: textColorsBlack))
                      ]),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.allEmployess["Name"],
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: fontWeighttext,
                                  color: textColorsBlack))
                        ])
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.allEmployess["NumberOfUser"],
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
                  widget.allEmployess["Bills"].length > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "${widget.allEmployess["Bills"].length}",
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
                            ])
                      : const SizedBox(),
                  widget.allEmployess["Bills"].length > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${widget.allEmployess["Cach"]}",
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
                            ])
                      : const SizedBox(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.allEmployess["UserName"],
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: fontWeighttext,
                                color: textColorsBlack)),
                        const SizedBox(width: 30),
                        Text(widget.allEmployess["Type"],
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: fontWeighttext,
                                color: textColorsBlack))
                      ]),
                ])));
  }
}
