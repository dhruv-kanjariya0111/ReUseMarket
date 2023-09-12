import 'package:flutter/material.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';

class DetailsFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const DetailsFieldWidget({
    super.key,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the border radius as needed
        ),
        labelText: detailsText,
        prefixIcon: const Icon(Icons.description),
      ),
      maxLines: 3,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validDetailsText;
        } else {
          return null;
        }
      },
    );
  }
}
