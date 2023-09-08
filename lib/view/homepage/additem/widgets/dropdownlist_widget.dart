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
              border: Border.all(width: 0),
              // border: Border.all(
              //   color: Color(0xFFD9ECC7),
              // ),
              color: Color(0xFFD9ECC7),
              borderRadius: BorderRadius.circular(20.0)),
          child: DropdownButton<String>(
            // hint: Text(''),
            elevation: 8,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            isExpanded: true,
            // underline: Border.all(),
            borderRadius: BorderRadius.circular(30),
            dropdownColor: Color(0xFFD9ECC7),
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
                  style: TextStyle(
                    color: Color(0xFF07A3B2),
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
