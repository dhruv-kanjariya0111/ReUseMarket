import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/main.dart';
import 'package:ReUseMarket/model/itemmodel/item_model.dart';
import 'package:ReUseMarket/view/core/address_sheet.dart';
import 'package:ReUseMarket/view/core/button_widget.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/core/widgets.dart';
import 'package:ReUseMarket/view/homepage/additem/widgets/details_field.dart';
import 'package:ReUseMarket/view/homepage/additem/widgets/dropdownlist_widget.dart';
import 'package:ReUseMarket/view/homepage/additem/widgets/image_select_widget.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});
  static ItemModel itemModel = Get.put(ItemModel());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          // Hide the keyboard when tapping anywhere on the screen
          FocusScope.of(context).unfocus();
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: boxDecoration,
            child: Form(
              key: itemModel.itemformKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    kheight20,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Card(
                          child: TextFormField(
                            controller: itemModel.itemTitleController,
                            decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.add_circle_outline_outlined),
                              labelText: titleText,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return validTitleText;
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    kheight20,
                    kheight20,
                    const Text(
                      categoryText,
                      style: TextStyle(
                          color: kblackColor, fontWeight: FontWeight.w500),
                    ),
                    kheight10,
                    MyDropdownList(),
                    kheight20,
                    kheight20,
                    DetailsFieldWidget(
                        controller: itemModel.itemDetailController),
                    const Text(
                      priceText,
                      style: TextStyle(
                          color: kwhiteColor, fontWeight: FontWeight.w500),
                    ),
                    kheight10,
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     AmountContainer(
                    //       hinText: dayText,
                    //       controller: itemModel.dayController,
                    //       onChanged: (value) {
                    //         int day = int.tryParse(value) ?? 0;
                    //         itemModel.weekController.text =
                    //             (day * 7).ceil().toString();
                    //         itemModel.monthController.text =
                    //             (day * 30).ceil().toString();
                    //       },
                    //       width: 100.0,
                    //     ),
                    //     AmountContainer(
                    //       hinText: weekText,
                    //       controller: itemModel.weekController,
                    //       width: 100.0,
                    //     ),
                    //     AmountContainer(
                    //       hinText: monthText,
                    //       controller: itemModel.monthController,
                    //       width: 100.0,
                    //     )
                    //   ],
                    // ),
                    kheight10,
                    const Text(
                      upload3imageText,
                      style: TextStyle(
                          color: kblackColor, fontWeight: FontWeight.w500),
                    ),
                    ButtonWidget(
                      text: imagesText,
                      onpressed: (context) {
                        itemModel.imageFileList.clear();
                        itemModel.pickMultipleImage();
                      },
                      width: 400.0,
                      height: 40.0,
                      color: kgrey,
                    ),
                    kheight10,
                    const ImageSelectWidget(),
                    kheight20,
                    Align(
                      alignment: Alignment.center,
                      child: ButtonWidget(
                        width: 150.0,
                        text: saveText,
                        onpressed: (p0) {
                          final isValid =
                              itemModel.itemformKey.currentState!.validate();
                          if (!isValid) return;
                          if (itemModel.imageFileList.length != 3) {
                            Get.snackbar(upload3imageText, "",
                                backgroundColor: kredColor,
                                colorText: kwhiteColor,
                                snackPosition: SnackPosition.BOTTOM);
                            return;
                          }

                          showAddressSheet(context: context, isAddItem: true);
                        },
                        color: Color(0xFF07A3B2),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
