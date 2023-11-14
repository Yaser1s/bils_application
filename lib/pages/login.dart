import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:test10/pages/forgetpass.dart';
import 'package:test10/firebases/auth.dart';
import 'package:test10/shared/colors.dart';
import 'package:test10/shared/custom_textfield.dart';
import 'package:test10/pages/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //
  //

  // final _formKey = GlobalKey<FormState>();

  bool isLoding = false;
  bool isVisable = true;

  //

  @override
  void dispose() {
    emailCnt.dispose();
    passwordOfUserCnt.dispose();
    super.dispose();
  }

  final emailCnt = TextEditingController();
  final passwordOfUserCnt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: backgrond,
            body: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          const Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: "myfont"),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          SvgPicture.asset(
                            "assets/icons/signup.svg",
                            height: 238,
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 70),
                              child: Column(children: [
                                const SizedBox(height: 23),
                                SizedBox(
                                    height: 50,
                                    child: TextField(
                                        controller: emailCnt,
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textAlign: TextAlign.right,
                                        obscureText: false,
                                        decoration:
                                            decorationTextfield.copyWith(
                                          suffixIcon: Icon(
                                            Icons.email,
                                            color: Colors.grey[700],
                                            size: 19,
                                          ),
                                          hintText: "البريد الالكتروني : ",
                                        ))),
                                const SizedBox(height: 23),
                                SizedBox(
                                    height: 50,
                                    child: TextField(
                                        textInputAction: TextInputAction.done,
                                        controller: passwordOfUserCnt,
                                        textAlign: TextAlign.right,
                                        obscureText: isVisable ? true : false,
                                        decoration:
                                            decorationTextfield.copyWith(
                                                prefixIcon: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        isVisable = !isVisable;
                                                      });
                                                    },
                                                    icon: isVisable
                                                        ? Icon(Icons.visibility,
                                                            size: 20,
                                                            color: Colors
                                                                .grey[700])
                                                        : const Icon(
                                                            Icons
                                                                .visibility_off,
                                                            size: 20,
                                                            color: Colors
                                                                .lightBlue,
                                                          )),
                                                suffixIcon: Icon(
                                                  Icons.lock,
                                                  color: Colors.grey[700],
                                                  size: 19,
                                                ),
                                                hintText: "الرقم السري : ")))
                              ])),
                          const SizedBox(height: 23),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 70),
                            child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isLoding = !isLoding;
                                  });
                                  await AuthMethod().signIn(
                                      emaill: emailCnt.text,
                                      passwordd: passwordOfUserCnt.text,
                                      context: context);

                                  setState(() {
                                    isLoding = !isLoding;
                                  });
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
                                    child: isLoding
                                        ? const CircularProgressIndicator(
                                            color: Colors.white)
                                        : const Text("تسجيل الدخول",
                                            style: TextStyle(fontSize: 24)),
                                  ),
                                )),
                          ),
                          const SizedBox(height: 7),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ForgetPass()),
                                );
                              },
                              style: const ButtonStyle(
                                  textStyle: MaterialStatePropertyAll(TextStyle(
                                      decoration: TextDecoration.underline,
                                      color:
                                          Color.fromARGB(255, 70, 151, 218)))),
                              child: const Text("هل نسيت كلمة المرور ؟")),
                          const SizedBox(height: 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Register()),
                                    );
                                  },
                                  child: const Text(
                                    "تسجيل جديد",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        color:
                                            Color.fromARGB(255, 70, 151, 218)),
                                  )),
                              const Text(" ليس لديك حساب ؟ "),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      top: 30,
                      child: SvgPicture.asset("assets/icons/logo-t.svg",
                          width: 130))
                ]))));
  }
}

  // }