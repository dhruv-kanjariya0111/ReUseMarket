import 'package:flutter/material.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';

class DetailsFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const DetailsFieldWidget({
    super.key,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 90.0,
      decoration: BoxDecoration(
        color: Color(0xFFD9ECC7),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: detailsText,
          prefixIcon: Icon(Icons.description),
        ),
        maxLines: 3,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validDetailsText;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
