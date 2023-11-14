import 'package:flutter/material.dart';
import 'package:test10/firebases/firebase_farms.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/shared/custom_textfield.dart';
import 'package:test10/shared/snackbar.dart';
import 'package:test10/shared/strings.dart';

class AddNewDriver extends StatefulWidget {
  final Map data;
  const AddNewDriver({super.key, required this.data});

  @override
  State<AddNewDriver> createState() => _AddNewDriverState();
}

class _AddNewDriverState extends State<AddNewDriver> {
  final driverNameCnt = TextEditingController();

  final driverPhoneNumberCnt = TextEditingController();

  final driverNumberCnt = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 190, top: 180),
      child: Scaffold(
        appBar: AppBar(backgroundColor: appbarcolor),
        backgroundColor: backgrond,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                        controller: driverNameCnt,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.right,
                        decoration: decorationTextfield.copyWith(
                            hintText: "ادخل اسم السائق",
                            suffixIcon: const Icon(Icons.person,
                                color: iconsColor, size: 19))),
                    const SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        validator: (number) {
                          return number!.contains(RegExp(r'.{8,}'))
                              ? null
                              : enterPhoneNumberTrue;
                        },
                        controller: driverPhoneNumberCnt,
                        maxLength: 8,
                        textAlign: TextAlign.right,
                        textInputAction: TextInputAction.done,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                        decoration: decorationTextfield.copyWith(
                          hintText: phoneNumber,
                          icon: const Icon(
                            Icons.phone,
                            color: iconsColor,
                            size: 19,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: driverNumberCnt,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.phone,
                        decoration: decorationTextfield.copyWith(
                            hintText: "رقم المزرعة"),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(buttons)),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate() ||
                          driverNumberCnt.text.isEmpty) {
                        showSnackBar(context, "اكتب رقك صحيح");
                      } else {
                        await AddDriver().addDriver(
                            nameFarmar: widget.data["WhowInCharge"],
                            context: context,
                            uidFarm: widget.data["UidFarm"],
                            driverName: driverNameCnt.text,
                            driverNumber: driverNumberCnt.text,
                            driverPhoneNumber:
                                "05${driverPhoneNumberCnt.text}");
                      }
                    },
                    child: const Text("اضافة مزرعة"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
