import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/main.dart';
import 'package:ReUseMarket/model/loginmodel/mobx/login_mobx.dart';
import 'package:ReUseMarket/view/core/appbar_widget.dart';
import 'package:ReUseMarket/view/core/button_widget.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/core/textformfield.dart';
import 'package:ReUseMarket/view/core/widgets.dart';
import 'package:ReUseMarket/controller/signin/forgot_function.dart';

GlobalKey formKey2 = GlobalKey<FormState>();

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  static LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(title: forgotpassText),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: boxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: formKey2,
              child: Column(
                children: [
                  const Text(
                    mailtoResetPassText,
                    style: TextStyle(color: kwhiteColor, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  kheight20,
                  TextFieldWidget(
                    hintText: mailText,
                    controller: loginController.emailController.value,
                    isEmail: true,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  kheight20,
                  ButtonWidget(
                    text: resetPassText,
                    onpressed: (context) {
                      resetPassword(
                          email:
                              loginController.emailController.value.text.trim(),
                          context: context);
                    },
                    color: kbluegreyColor,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
