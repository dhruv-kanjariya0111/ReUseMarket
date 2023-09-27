import 'package:ReUseMarket/view/homepage/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/model/homemodel/home_model.dart';
import 'package:ReUseMarket/view/core/logout_button.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/core/widgets.dart';
import 'package:ReUseMarket/view/homepage/profile/screens/mygadgetscreen/my_gadget_screen.dart';
import 'package:ReUseMarket/view/homepage/profile/screens/terms_n_policy_screen.dart';
import 'package:ReUseMarket/view/homepage/profile/widget/about_us_widget.dart';
import 'package:ReUseMarket/view/homepage/profile/widget/listtile_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DrawerWidget extends StatelessWidget {
  final String email;
  DrawerWidget({super.key, required this.email});
  final HomeGetx controller = Get.put(HomeGetx());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: const Color(0xFF07A3B2),
      backgroundColor: const Color(0xFFD9ECC7),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 60.0,
            ),
            const Text(
              signedAsText,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
               email,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            kheight20,
            kheight20,
            ListTileWidget(
              height: 50.0,
              title: AppLocalizations.of(context)!.home,
              icon: Icons.home,
              onTap: () {
                controller.selectedIndex.value = 0;
                Get.back();
              },
            ),
            ListTileWidget(
              height: 50.0,
              title: AppLocalizations.of(context)!.addItem,
              icon: Icons.add,
              onTap: () {
                controller.selectedIndex.value = 1;
                Get.back();
              },
            ),

            ListTileWidget(
              height: 50.0,
              title: AppLocalizations.of(context)!.myGadget,
              icon: Icons.local_grocery_store_rounded,
              onTap: () {
                Get.to(() => MyGadgetsScreen());
              },
            ),

            ListTileWidget(
              height: 50.0,
              title: AppLocalizations.of(context)!.account,
              icon: Icons.person,
              onTap: () {
                Get.to(() => ProfileScreen());
                // controller.selectedIndex.value = 4;
                // Get.back();
              },
            ),

            ListTileWidget(
              height: 50.0,
              title: AppLocalizations.of(context)!.termsAndPolicies,
              icon: Icons.assignment,
              onTap: () {
                Get.to(() => const TermsAndPoliciesScreen());
              },
            ),

            ListTileWidget(
              height: 50.0,
              title: AppLocalizations.of(context)!.about,
              icon: Icons.info,
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AboutUsWidget();
                  },
                );
              },
            ),
            kheight20,
            const LogoutButton(),
            // kheight10
          ],
        ),
      ),
    );
  }
}
