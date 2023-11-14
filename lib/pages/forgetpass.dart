// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/shared/custom_textfield.dart';
import 'package:test10/shared/snackbar.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _formKey = GlobalKey<FormState>();
  final EmailOfUserCnt = TextEditingController();
  bool isLoding = false;

  //

  ForgetPassword() async {
    setState(() {
      isLoding = true;
    });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: EmailOfUserCnt.text);
      if (!mounted) return;
      showSnackBar(context, "تم ارسال رسالة الى الايميل");
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR ${e.code}");
    }
    setState(() {
      isLoding = false;
    });
  }

  @override
  void dispose() {
    EmailOfUserCnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrond,
        appBar: AppBar(backgroundColor: appbarcolor),
        body: Center(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("ادخل ايميلك لاستعادة كلمة المرور",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: TextFormField(
                          // we return "null" when something is valid
                          validator: (email) {
                            return email!.contains(RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                                ? null
                                : "ادخل ايميل صحيح";
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: EmailOfUserCnt,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          decoration: decorationTextfield.copyWith(
                            icon: Icon(
                              Icons.email,
                              color: Colors.grey[700],
                              size: 19,
                            ),
                            hintText: "ادخل ايميلك : ",
                          )),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await ForgetPassword();
                          } else {
                            showSnackBar(context, "ERROR");
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(buttons),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                        ),
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Center(
                            child: isLoding
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text("نسيت كلمة المرور",
                                    style: TextStyle(fontSize: 24)),
                          ),
                        )),
                  ],
                ),
              )),
        ));
  }
}
