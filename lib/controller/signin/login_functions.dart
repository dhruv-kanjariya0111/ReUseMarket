import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/main.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';

Future signIn(
    {required context,
    required TextEditingController email,
    required TextEditingController password}) async {
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim())
        .then((value) async => {
              Get.snackbar(
                "Signed in as ${email.text}",
                "",
                backgroundColor: kgreenColor,
                colorText: kwhiteColor,
              ),
              email.clear(),
              password.clear()
            });
    // ignore: unused_catch_clause
  } on FirebaseAuthException catch (e) {
    Get.snackbar(
      "Username/password is incorrect",
      "",
      backgroundColor: kredColor,
      colorText: kwhiteColor,
    );
  }
  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
