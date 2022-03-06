import 'package:e_unique_school/auth/LoginController.dart';
import 'package:e_unique_school/auth/Registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  LoginController signInController = Get.put(LoginController());

  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  final _logKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _logKey,
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 1,
                child: Image.asset("assets/school.png"),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.cyan, Color.fromARGB(255, 28, 136, 150)],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    _textinput(
                        controller: mobile,
                        inputAction: TextInputAction.next,
                        userErrorText: "Mobile number is required!",
                        hint: "Mobile Number",
                        icon: Icon(Icons.phone_android_outlined,
                            color: Colors.purple)),
                    const SizedBox(
                      height: 14,
                    ),
                    _textinput(
                        controller: password,
                        userErrorText: "Password is required!",
                        inputAction: TextInputAction.done,
                        hint: " Password",
                        icon: Icon(Icons.vpn_key, color: Colors.purple)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    InkWell(
                      onTap: () {
                        login();
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Center(
                          child: Text(
                            "LogIn",
                            style: GoogleFonts.lateef(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(Registration());
                        },
                        child: Container(
                          child: Text("Have you no account? Registration",
                              style: GoogleFonts.sofia(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    final _isValid = _logKey.currentState!.validate();
    if (_isValid) {
      signInController.singIn(mobile.text, password.text);
    } else {
      Get.snackbar(
        "Sign IN Failed",
        "User Name or Password is wrong",
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
  }
}

Widget _textinput({controller, hint, icon, inputAction, userErrorText}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: TextFormField(
      textInputAction: inputAction,
      validator: (value) {
        if (value!.isEmpty) {
          return userErrorText;
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon,
        hintStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          gapPadding: 4.6,
        ),
      ),
    ),
  );
}
