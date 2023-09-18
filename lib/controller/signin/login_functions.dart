import 'package:ReUseMarket/view/homepage/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/main.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:shimmer/shimmer.dart';

Future signIn(
    {required context,
    required TextEditingController email,
    required TextEditingController password}) async {
  showDialog(
    context: context,
    builder: (context) => Shimmer.fromColors(
      baseColor: Colors.grey.shade300, // Customize base color
      highlightColor: Colors.grey.shade400, // Customize highlight color
      child: Container(
        color: Colors.white,
        // Background color
      ),
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
                backgroundColor: const Color.fromARGB(255, 255, 241, 193),
                colorText: kblackColor,
              ),
              Get.offAll(const MainScreen()),
              email.clear(),
              password.clear()
            });
    // ignore: unused_catch_clause
  } on FirebaseAuthException catch (e) {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    Get.snackbar(
      "Username/password is incorrect",
      "",
      backgroundColor: Colors.pink.shade100,
      colorText: kblackColor,
    );
  }
}
