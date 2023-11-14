import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/shared/snackbar.dart';

class ForgetPass2 extends StatefulWidget {
  final String emaill;
  const ForgetPass2({super.key, required this.emaill});

  @override
  State<ForgetPass2> createState() => _ForgetPass2State();
}

class _ForgetPass2State extends State<ForgetPass2> {
  bool isLoding = false;

  //

  forgetPassword() async {
    setState(() {
      isLoding = true;
    });
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: widget.emaill);
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrond,
        appBar: AppBar(backgroundColor: appbarcolor),
        body: Center(
          child: Form(
              child: Padding(
            padding: const EdgeInsets.all(55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("اضغط لتغيير الرقم السري بالايميل",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 23),
                ElevatedButton(
                    onPressed: () async {
                      await forgetPassword();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(buttons),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
