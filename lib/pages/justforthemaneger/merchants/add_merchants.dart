// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test10/firebases/firebase_merchants.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/shared/custom_textfield.dart';
import 'package:test10/shared/snackbar.dart';

class AddNewMerchants extends StatefulWidget {
  const AddNewMerchants({super.key});

  @override
  State<AddNewMerchants> createState() => _AddNewMerchantsState();
}

class _AddNewMerchantsState extends State<AddNewMerchants> {
  //

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final heOweUs = TextEditingController();
  // final typeDelar = TextEditingController();

  //

  bool isLoding = false;

  closeUser() async {
    setState(() {
      isLoding = true;
    });
    if (
        // typeDelar.text.isNotEmpty ||
        phoneNumber.text.isNotEmpty ||
            name.text.isNotEmpty ||
            heOweUs.text.isNotEmpty) {
      try {
        await addMerchantsss().addMerchants(
            typeDelar: "تاجر", // typeDelar.text,
            numberPhone: "05${phoneNumber.text}",
            name: name.text,
            howMuchOweHim: double.parse(heOweUs.text),
            context: context);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } catch (e) {
        showSnackBar(context, e.toString());
      }
    }
    setState(() {
      isLoding = false;
    });
  }

  @override
  void dispose() {
    name.dispose();
    phoneNumber.dispose();
    heOweUs.dispose();
    // typeDelar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 220, top: 210),
        child: Scaffold(
            backgroundColor: backgrond,
            body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                            padding:
                                const EdgeInsets.only(right: 100, left: 64),
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.right,
                                controller: name,
                                decoration: decorationTextfield.copyWith(
                                    hintText: "اسم التاجر :",
                                    icon: Icon(Icons.person,
                                        color: Colors.grey[700], size: 20)))),
                        const SizedBox(height: 20),
                        Padding(
                            padding:
                                const EdgeInsets.only(right: 100, left: 64),
                            child: TextFormField(
                                validator: (number) {
                                  return number!.contains(RegExp(r'.{8,}'))
                                      ? null
                                      : "ادخل رقم صحيح";
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.phone,
                                controller: phoneNumber,
                                maxLength: 8,
                                decoration: decorationTextfield.copyWith(
                                    hintText: "رقم التاجر :",
                                    icon: Icon(Icons.phone,
                                        color: Colors.grey[700], size: 20)))),
                        const SizedBox(height: 10),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                controller: heOweUs,
                                decoration: decorationTextfield.copyWith(
                                    hintText: "له :"))),
                        const SizedBox(height: 20),
                        // Padding(
                        //     padding:
                        //         const EdgeInsets.symmetric(horizontal: 100),
                        //     child: TextFormField(
                        //         autovalidateMode:
                        //             AutovalidateMode.onUserInteraction,
                        //         textInputAction: TextInputAction.next,
                        //         keyboardType: TextInputType.text,
                        //         textAlign: TextAlign.right,
                        //         controller: typeDelar,
                        //         decoration: decorationTextfield.copyWith(
                        //             hintText: "نوع التاجر :"))),
                      ]),
                  Column(children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: ElevatedButton(
                            onPressed: () async {
                              await closeUser();
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
                                    child: isLoding
                                        ? CircularProgressIndicator(
                                            color: Colors.white)
                                        : Text("اضافة تاجر",
                                            style: TextStyle(fontSize: 24)))))),
                  ])
                ]))));
  }
}
