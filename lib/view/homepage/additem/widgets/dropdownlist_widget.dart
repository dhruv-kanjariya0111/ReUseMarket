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
          padding: const EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.grey),
              // border: Border.all(
              //   color: Color(0xFFD9ECC7),
              // ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0)),
          child: DropdownButton<String>(
            // hint: Text(''),
            elevation: 8,

            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            isExpanded: true,
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(200),
            dropdownColor: kwhiteColor,
            alignment: AlignmentDirectional.center,
            value: itemModel.dropdownValue.value,
            onChanged: (value) {
              itemModel.onDropdownChanged(value!);
            },

            items: categories.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                alignment: Alignment.center,
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF07A3B2),
                  ),
                ),
              );
            }).toList(),
            itemHeight: 50,
          ),
        ));
  }
}
