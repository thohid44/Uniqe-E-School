import 'package:e_unique_school/auth/Login.dart';
import 'package:e_unique_school/auth/RegistrationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration extends StatelessWidget {
  RegistrationController signController = Get.put(RegistrationController());
  TextEditingController name = TextEditingController();

  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  final _regKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Form(
            key: _regKey,
            child: ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Image.asset("assets/school.png"),
                  decoration: BoxDecoration(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      _textinput(
                          controller: name,
                          userErrorText: "Name is required!",
                          hint: "Enter Name",
                          icon: Icon(
                            Icons.person_add_alt_1_outlined,
                            color: Colors.purple,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(height: 10),
                      _textinput(
                          controller: mobile,
                          userErrorText: "Mobile no is required!",
                          hint: "Enter Mobile",
                          icon: Icon(
                            Icons.mail,
                            color: Colors.purple,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(height: 10),
                      _textinput(
                          controller: password,
                          userErrorText: "Password is required!",
                          hint: "Enter Password",
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.purple,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Text("Registration",
                                style: GoogleFonts.laila(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(Login());
                        },
                        child: Container(
                          child: Text("Have you an account? Login Here",
                              style: GoogleFonts.sofia(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() {
    final _isValid = _regKey.currentState!.validate();
    if (_isValid) {
      signController.signUpUser(name.text, mobile.text, password.text);
    } else {
      return null;
    }
  }
}

Widget _textinput({controller, hint, icon, userErrorText}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30))),
    child: TextFormField(
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
        hintStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          gapPadding: 4.6,
        ),
      ),
    ),
  );
}
