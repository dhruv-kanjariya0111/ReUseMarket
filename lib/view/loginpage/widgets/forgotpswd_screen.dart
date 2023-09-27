import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/model/loginmodel/mobx/login_mobx.dart';
import 'package:ReUseMarket/view/core/appbar_widget.dart';
import 'package:ReUseMarket/view/core/button_widget.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/core/textformfield.dart';
import 'package:ReUseMarket/view/core/widgets.dart';
import 'package:ReUseMarket/controller/signin/forgot_function.dart';

GlobalKey formKey2 = GlobalKey<FormState>();

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(title: forgotpassText),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // decoration: boxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: formKey2,
              child: Column(
                children: [
                  const Text(
                    mailtoResetPassText,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  kheight20,
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(109, 158, 158, 158),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFieldWidget(
                      hintText: '',
                      label: mailText,
                      controller: loginController.emailController.value,
                      isEmail: true,
                      keyboardType: TextInputType.emailAddress,
                    ),
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
                    color: const Color(0xFF07A3B2),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
