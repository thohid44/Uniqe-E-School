import 'package:e_unique_school/auth/RegistrationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Registration extends StatelessWidget {
  RegistrationController signController = Get.put(RegistrationController());
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _regKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _regKey,
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 1,
                child: const Icon(Icons.person, size: 80, color: Colors.white),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.deepPurple],
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
                        controller: email,
                        userErrorText: "E-mail is required!",
                        hint: "Enter Email",
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
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          signUp();
                        },
                        child: const Text(
                          "Registration",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() {
    final _isValid = _regKey.currentState!.validate();
    if (_isValid) {
      signController.signUpUser(name.text, email.text, password.text);
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
        border: const OutlineInputBorder(
          gapPadding: 4.6,
        ),
      ),
    ),
  );
}
