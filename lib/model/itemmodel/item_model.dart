import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ReUseMarket/controller/profile/fetch_profile_details.dart';
import 'package:ReUseMarket/main.dart';
import 'package:ReUseMarket/model/homemodel/gadgets.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';

class ItemModel extends GetxController {
  TextEditingController itemTitleController = TextEditingController();
  TextEditingController itemDetailController = TextEditingController();
  // TextEditingController dayController = TextEditingController();
  // TextEditingController weekController = TextEditingController();
  // TextEditingController monthController = TextEditingController();
  final itemformKey = GlobalKey<FormState>();
  var dropdownValue = 'Electronics'.obs;

  final ImagePicker imagePicker = ImagePicker();
  void onDropdownChanged(String value) {
    dropdownValue.value = value;
  }

  ProfileControl profileControl = ProfileControl();

  String image1Url = '';
  String image2Url = '';
  String image3Url = '';

  RxList<XFile> imageFileList = RxList<XFile>();
  Future<void> pickMultipleImage() async {
    final List<XFile> selectedImages =
        await imagePicker.pickMultiImage(imageQuality: 75);
    if (selectedImages.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }
  }

  Future<String> uploadFile(File file) async {
    String uniqueFileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref('images');
    Reference ref = storageRef.child(uniqueFileName);
    final uploadTask = ref.putFile(file, metaData);
    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  Future<void> storeToFirestore(
      {required categoryValue, required email, required address}) async {
    try {
      final snapshot = profileControl.docRef
          .doc(FirebaseAuth.instance.currentUser!.email.toString());
      Map? data;
      var docsnapshot = await snapshot.get();

      if (docsnapshot.exists) {
        data = docsnapshot.data();
      }
      if (data == null) {
        Get.snackbar("You are location is not available", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: kredColor,
            colorText: kwhiteColor);
        return;
      }
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
      );

      for (var i = 0; i < imageFileList.length; i++) {
        File file = File(imageFileList[i].path);
        if (i == 0) {
          image1Url = await uploadFile(file);
        } else if (i == 1) {
          image2Url = await uploadFile(file);
        } else {
          image3Url = await uploadFile(file);
        }
      }

      String itemTitle = itemTitleController.text.trim();
      String category = categoryValue;
      String itemDetails = itemDetailController.text.trim();
      // String dayPrice = dayController.text.trim();
      // String weekPrice = weekController.text.trim();
      // String monthPrice = monthController.text.trim();
      final docUser = FirebaseFirestore.instance.collection(appName);

      Gadgets gadgetTosend = Gadgets(
          title: itemTitle,
          email: email,
          category: category,
          details: itemDetails,
          image1: image1Url,
          image2: image2Url,
          image3: image3Url,
          // dayPrice: dayPrice,
          // weekPrice: weekPrice,
          address: address,
          // monthPrice: monthPrice,
          available: 'true',
          name: data['name'],
          area: address['area'],
          city: address['city'],
          pincode: address['pincode'],
          houseNo: address['houseNo'],
          state: address['state']);

      Map<String, dynamic> gadgetMap = gadgetTosend.toMap();

      docUser.add(gadgetMap);
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      Get.snackbar("Item added succesfully", "",
          backgroundColor: kgreenColor,
          colorText: kwhiteColor,
          snackPosition: SnackPosition.BOTTOM);
      itemTitleController.clear();
      itemDetailController.clear();
      // dayController.clear();
      // weekController.clear();
      // monthController.clear();
      imageFileList.clear();
    } on Exception catch (e) {
      Get.snackbar(e.toString(), "",
          backgroundColor: kgreenColor,
          colorText: kwhiteColor,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
