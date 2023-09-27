import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/main.dart';
import 'package:ReUseMarket/model/signupmodel/mobx/signup_model.dart';
import 'package:ReUseMarket/model/signupmodel/user_model.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/utils.dart';

Future<void> signUp(
    {required context, required email, required password}) async {
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    Utils.showSnackBar(
      e.message,
      color: Colors.red[200],
      textColor: kwhiteColor,
    );
  }
  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}

Future<void> userSignupDetailsToFireStore(
    {required name,
    required email,
    required phoneNumber,
    required password}) async {
  Get.dialog(
    const Center(
      child: CircularProgressIndicator(),
    ),
  );

  final SignUpModel signupmodel = SignUpModel();

  final docUser = FirebaseFirestore.instance.collection("Users").doc(email);

  CreateUser createUser = CreateUser(
    name: name,
    email: email,
    password: password,
    addresses: [],
    phoneNumber: phoneNumber,
    idImage: 'url',
  );

  Map<String, dynamic> userDataToSend = createUser.toMap();
  await docUser.set(userDataToSend);
  signupmodel.clearAll();
  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
