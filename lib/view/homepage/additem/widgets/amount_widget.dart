import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/model/itemmodel/item_model.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';

class AmountContainer extends StatelessWidget {
  final String hinText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final double? height;
  final double? width;
  final FocusNode focusNode;
  AmountContainer(
      {super.key,
      required this.hinText,
      required this.controller,
      required this.focusNode,
      this.onChanged,
      this.height,
      this.width});
  // final ItemModel itemModel = Get.put(ItemModel());
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validPriceText;
          }
          final n = int.tryParse(value);
          if (n == null) {
            return validNumberText;
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinText,
            prefixIcon: const Icon(Icons.monetization_on_outlined)),
      ),
    );
  }
}
