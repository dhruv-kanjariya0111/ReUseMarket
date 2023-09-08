import 'package:ReUseMarket/view/splashscreen/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/controller/signout/signout_function.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 50.0,
      child: ElevatedButton(
          onPressed: () {
            Get.dialog(
              AlertDialog(
                title: const Text(warningText),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(cancelText)),
                  TextButton(
                      onPressed: () async {
                        await signOutFunc(context: context);
                        Get.offAll(
                          WelcomeScreen(),
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.logout))
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF07A3B2),
              side: BorderSide.none,
              shape: const StadiumBorder()),
          child: Text(
            AppLocalizations.of(context)!.logout,
            style: const TextStyle(
                color: Color(0xFFD9ECC7), fontWeight: FontWeight.bold),
          )),
    );
  }
}
