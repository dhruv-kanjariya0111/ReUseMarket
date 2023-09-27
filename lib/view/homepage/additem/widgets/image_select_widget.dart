import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/model/itemmodel/item_model.dart';

class ImageSelectWidget extends StatelessWidget {
  ImageSelectWidget({super.key});
  final ItemModel itemModel = Get.put(ItemModel());
  @override
  Widget build(BuildContext context) {
    return GetX<ItemModel>(builder: (_) {
      if (itemModel.imageFileList.isEmpty) {
        return const SizedBox();
      }
      return Container(
        padding: const EdgeInsets.all(5.0),
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF07A3B2),
            ),
            color: Color.fromARGB(255, 219, 235, 204),
            borderRadius: BorderRadius.circular(15.0)),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Image.file(
                File(itemModel.imageFileList[index].path),
                fit: BoxFit.fill,
              );
            },
            itemCount: itemModel.imageFileList.length),
      );
    });
  }
}
