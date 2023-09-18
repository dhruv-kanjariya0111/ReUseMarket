import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/model/itemmodel/item_model.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';

class MyDropdownList extends StatelessWidget {
  final ItemModel itemModel = Get.put(ItemModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Set your desired border color
                  width: 2.0, // Set the border width
                ),
                borderRadius:
                    BorderRadius.circular(20.0), // Set the border radius
              ),
              child: DropdownButton<String>(
                elevation: 8,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                isExpanded: true,
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(30),
                dropdownColor: kwhiteColor,
                value: itemModel.dropdownValue.value,
                onChanged: (value) {
                  itemModel.onDropdownChanged(value!);
                },
                items: categories.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Color(0xFF07A3B2),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
        // itemHeight: 50,
        );
  }
}
