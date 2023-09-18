import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ReUseMarket/controller/signup/signup_function.dart';
import 'package:ReUseMarket/main.dart';
import 'package:ReUseMarket/view/core/utils.dart';
import 'package:shimmer/shimmer.dart';

Future<void> siginInWithGoogle({
  required context,
}) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => GestureDetector(
      // Wrap with GestureDetector
      onTap: () {
        Navigator.pop(context); // Dismiss the dialog when tapped outside
      },
      child: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade400, // Customize base color
          highlightColor: Colors.grey.shade200, // Customize highlight color
          child: Container(
            color: Colors.white, // Background color
          ),
        ),
      ),
    ),
  );
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
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
    return signin;
  } on Exception catch (e) {
    Utils.showSnackBar(e.toString());
  }
}
