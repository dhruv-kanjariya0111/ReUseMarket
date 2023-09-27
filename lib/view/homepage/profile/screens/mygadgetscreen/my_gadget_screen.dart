import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ReUseMarket/controller/profile/mygadgets/mygadgets_control.dart';
import 'package:ReUseMarket/model/homemodel/gadgets.dart';
import 'package:ReUseMarket/view/core/appbar_widget.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/screen_container_widget.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/homepage/profile/widget/gadget_container.dart';
import 'package:shimmer/shimmer.dart';

class MyGadgetsScreen extends StatelessWidget {
  MyGadgetsScreen({super.key});
  final MyGadgetsController myGadget = MyGadgetsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: myGadgetsText),
        ),
        body: CustomContainer(
          child: StreamBuilder<QuerySnapshot>(
              stream: myGadget.query
                  .where('email',
                      isEqualTo:
                          FirebaseAuth.instance.currentUser!.email.toString())
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  QuerySnapshot? querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> documents = querySnapshot!.docs;

                  if (documents.isEmpty) {
                    return const Center(
                      child: Text(
                        noGadgetsText,
                        style: TextStyle(
                            color: kblackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final gadget = Gadgets.fromSnapshot(documents[index]);

                      return GadgetContainer(
                          gadget: gadget, documents: documents, index: index);
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      wrongText,
                      style: TextStyle(
                          color: kblackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade400, // Customize base color
                    highlightColor:
                        Colors.grey.shade200, // Customize highlight color
                    child: Container(
                      color: Colors.white, // Background color
                    ),
                  );
                }
              }),
        ));
  }
}
