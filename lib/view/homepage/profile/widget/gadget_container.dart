import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/controller/profile/mygadgets/mygadgets_control.dart';
import 'package:ReUseMarket/controller/update/update_item.dart';
import 'package:ReUseMarket/model/homemodel/gadgets.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/core/widgets.dart';
import 'package:ReUseMarket/view/homepage/profile/widget/image_container.dart';
import 'package:ReUseMarket/view/homepage/profile/screens/mygadgetscreen/update_gadgets_screen.dart';

class GadgetContainer extends StatelessWidget {
  final List<QueryDocumentSnapshot> documents;
  final Gadgets gadget;
  final int index;
  const GadgetContainer(
      {super.key,
      required this.documents,
      required this.index,
      required this.gadget});
  static final myGadget = MyGadgetsController();
  static final updateGadget = UpdateController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight20,
        Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.all(5.0),
          height: 150.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: kwhiteColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 5.0, spreadRadius: 5.0)
              ]),
          child: Row(
            children: [
              MyGadgetImageContainer(
                image: gadget.image1,
                size: 110.0,
              ),
              kwidth20,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kheight20,
                    Text(
                      gadget.title,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    kheight10,
                    const Text(
                      "Rs.${10}/day",
                      // "Rs.${gadget.dayPrice}/day",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w400),
                    ),
                    kheight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 120.0,
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () async {
                                final itemMap = await updateGadget.itemMap(
                                    doc: documents[index].id);
                                if (itemMap != null) {
                                  Get.to(() => UpdateGadget(
                                        gadget: gadget,
                                        doc: documents[index].id,
                                      ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kgrey,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder()),
                              child: const Text(
                                editGadgetText,
                                style: TextStyle(
                                    color: kwhiteColor,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.dialog(AlertDialog(
                                title: const Text(warningText),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        myGadget.deleteGadget(
                                            doc: documents[index].id);
                                        Get.back();
                                      },
                                      child: const Text(confirmText)),
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(cancelText))
                                ],
                              ));
                            },
                            iconSize: 27.0,
                            color: kredColor,
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
