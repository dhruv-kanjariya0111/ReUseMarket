import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';

class MyGadgetsController extends GetxController {
  final query = FirebaseFirestore.instance.collection("ReUseMarket");
  Future<List<String>> getDocumentIds() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await query
        .where('email',
            isEqualTo: FirebaseAuth.instance.currentUser!.email.toString())
        .get();
    List<String> documentIds = querySnapshot.docs.map((doc) => doc.id).toList();
    return documentIds;
  }

  late Stream<QuerySnapshot<Object?>> stream;
  MyGadgetsController() {
    stream = query
        .where('email',
            isEqualTo: FirebaseAuth.instance.currentUser!.email.toString())
        .snapshots();
  }

  deleteGadget({required doc}) {
    query.doc(doc).delete().whenComplete(() => Get.snackbar(
        "Your gadget deleted", "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.yellow.shade100,
        colorText: kblackColor));
  }
}
