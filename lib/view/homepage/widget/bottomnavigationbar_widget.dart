import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/model/homemodel/home_model.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

var selectedPage = 0;

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});
  static HomeGetx homeController = Get.put(HomeGetx());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
          backgroundColor: Color(0xFFD9ECC7),
          selectedItemColor: Color(0xFF07A3B2),
          unselectedItemColor: Colors.black.withOpacity(10),
          iconSize: 30.0,
          currentIndex: homeController.selectedIndex.value,
          onTap: homeController.changeTabIndex,
          items: [
            BottomNavigationBarItem(
                // backgroundColor: Colors.orange[900],
                icon: const Icon(
                  FontAwesomeIcons.house,
                  size: 25.0,
                  color: kblackColor,
                ),
                label: AppLocalizations.of(context)!.home),
            BottomNavigationBarItem(
                icon: const Icon(
                  FontAwesomeIcons.plus,
                  color: kblackColor,
                  size: 25.0,
                ),
                label: AppLocalizations.of(context)!.addItem),
            BottomNavigationBarItem(
                icon: const Icon(
                  FontAwesomeIcons.upload,
                  color: kblackColor,
                  size: 25.0,
                ),
                label: AppLocalizations.of(context)!.order),
            // BottomNavigationBarItem(
            //     icon: const Icon(
            //       FontAwesomeIcons.person,
            //       color: kblackColor,
            //       size: 20.0,
            //     ),
            //     label: AppLocalizations.of(context)!.account),
          ]),
    );
  }
}
