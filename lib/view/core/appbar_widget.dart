import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/model/homemodel/home_model.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final int indexValue;
  final List<Widget>? actions;
  final bool? isHome;
  const AppBarWidget(
      {super.key,
      required this.title,
      this.indexValue = 1,
      this.actions,
      this.isHome = false});
  static final HomeGetx controller = Get.put(HomeGetx());
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Color(0xFFD9ECC7), size: 32),
      backgroundColor: const Color(0xFF07A3B2),
      elevation: 0.0,
      // flexibleSpace: const AppBarContainer(),
      title: isHome == true
          ? const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ReUseMarket',
                  style: TextStyle(color: Color(0xFFD9ECC7)),
                ),
              ],
            )
          : Text(
              title,
              style: const TextStyle(color: Color(0xFFD9ECC7)),
            ),
      actions: actions,
    );
  }
}
