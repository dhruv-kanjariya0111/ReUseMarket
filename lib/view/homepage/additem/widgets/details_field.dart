import 'package:flutter/material.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';

class DetailsFieldWidget extends StatelessWidget {
  final TextEditingController controller;
   DetailsFieldWidget({
    super.key,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.grey),
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: detailsText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          labelStyle: TextStyle(
            fontSize: 16.0, // Adjust font size as needed
            color: Colors.grey, // Adjust color as needed
            fontWeight: FontWeight.normal,
            // Adjust font weight as needed
          ),
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
