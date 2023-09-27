import 'package:ReUseMarket/view/homepage/profile/account_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/model/homemodel/home_model.dart';
import 'package:ReUseMarket/view/chats/chat_screen.dart';
import 'package:ReUseMarket/view/core/animation.dart';
import 'package:ReUseMarket/view/core/appbar_widget.dart';
import 'package:ReUseMarket/view/homepage/additem/additem_screen.dart';
import 'package:ReUseMarket/view/homepage/home/home_screen.dart';
import 'package:ReUseMarket/view/homepage/widget/bottomnavigationbar_widget.dart';
import 'package:ReUseMarket/view/homepage/drawer/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

// final HomeGetx controller = Get.put(HomeGetx());

class MainScreen extends GetView<HomeGetx> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarWidget(
            isHome: true,
            title: AppLocalizations.of(context)!.appName,
            actions: [
              //   const LanguagePickerWidget(),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlideRightToLeftPageRoute(
                        builder: (context) => const ChatScreen(),
                        settings: const RouteSettings(name: '/my-new-page'),
                      ),
                    );

                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const ChatScreen(),
                    // ));
                  },
                  icon: Icon(Icons.message))
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
        drawer: DrawerWidget(email: user.email!),
        body: Obx(() {
          return IndexedStack(index: controller.selectedIndex.value, children: [
            HomeScreen(),
            AddItemScreen(),
            AccountScreen(),
            // ProfileScreen(),
            // OrderSCreen(),
          ]);
        }));
  }
}
