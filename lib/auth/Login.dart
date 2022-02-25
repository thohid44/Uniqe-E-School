import 'package:e_unique_school/auth/LoginController.dart';
import 'package:e_unique_school/auth/Registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  LoginController signInController = Get.put(LoginController());

  TextEditingController email = TextEditingController();
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
                child: const Icon(Icons.person, size: 80, color: Colors.white),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.cyan],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    ),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(120))),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    _textinput(
                        controller: email,
                        userErrorText: "E-mail is required!",
                        hint: "Enter Email",
                        icon: Icon(Icons.mail, color: Colors.purple)),
                    const SizedBox(
                      height: 10,
                    ),
                    _textinput(
                        controller: password,
                        userErrorText: "Password is required!",
                        hint: "Enter Password",
                        icon: Icon(Icons.vpn_key, color: Colors.purple)),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        child: const Text(
                          "LogIn",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Registration());
                      },
                      child: const Text(
                        "Have you no account? Registration",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
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
      signInController.singIn(email.text, password.text);
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

Widget _textinput({controller, hint, icon, userErrorText}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))),
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
        border: const OutlineInputBorder(
          gapPadding: 4.6,
        ),
      ),
    ),
  );
}
