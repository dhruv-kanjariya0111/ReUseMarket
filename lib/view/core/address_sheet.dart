import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/controller/additem/add_item_fun.dart';
import 'package:ReUseMarket/controller/bookgadget/add_address_fun.dart';
import 'package:ReUseMarket/view/core/widgets.dart';
import 'package:ReUseMarket/view/homepage/profile/screens/address_screen/add_address_screen.dart';

void showAddressSheet(
    {required BuildContext context,
    bool isAddItem = false,
    doc,
    validText,
    gadget,
    price}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight20,
          const Center(
            child: Text(
              'Select your address',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          kheight20,
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(FirebaseAuth.instance.currentUser!.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic>? documents = snapshot.data!.data();
                if (documents == null)
                  return const Center(child: Text("Add address"));
                if (documents['addresses'] == null) {
                  return const Center(child: Text("Add address"));
                }
                List<dynamic> address =
                    (documents['addresses'] as List<dynamic>);

                if (address.isEmpty) {
                  return const Center(child: SizedBox());
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: address.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                isAddItem == true
                                    ? addAddressForItemFunction(
                                        address: address[index])
                                    : addAddressFunction(
                                        doc: doc,
                                        validText: validText,
                                        gadget: gadget,
                                        price: price,
                                        address: address[index]);
                              },
                              child: Card(
                                color: Colors.blueGrey[100],
                                child: ListTile(
                                  title: Text('Address : '
                                      '${address[index]['houseNo']!}, ${address[index]['area']!}, ${address[index]['city']!}, ${address[index]['pincode']!}, ${address[index]['state']!}'),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text("Add address"),
                );
              }
            },
          ),
          Center(
            child: TextButton.icon(
                onPressed: () {
                  Get.to(() =>  AddAddressWidget());
                },
                icon: const Icon(Icons.home),
                label: const Text("Add new address")),
          )
        ],
      );
    },
  );
}
