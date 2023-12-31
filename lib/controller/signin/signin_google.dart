import 'package:ReUseMarket/view/homepage/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ReUseMarket/controller/signup/signup_function.dart';
import 'package:ReUseMarket/main.dart';
import 'package:ReUseMarket/view/core/utils.dart';

Future<void> siginInWithGoogle({
  required context,
}) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount == null) return;
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    final signin = await auth.signInWithCredential(credential).then((value) =>
        userSignupDetailsToFireStore(
            name: googleSignInAccount.displayName,
            email: googleSignInAccount.email,
            phoneNumber: "",
            password: ""));
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    Get.off(const MainScreen());

    return signin;
  } on Exception catch (e) {
    Utils.showSnackBar(e.toString());
  }
}
