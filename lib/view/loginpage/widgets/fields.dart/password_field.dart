import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/model/loginmodel/mobx/login_mobx.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController? confirmPassword;
  final bool? isConfirm;
   PasswordField(
      {super.key,
      required this.passwordController,
      this.isConfirm = false,
      this.confirmPassword});
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(83, 158, 158, 158),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
              label: isConfirm!
                  ? const Text(confirmPassText)
                  : const Text(passwordText),
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                  onTap: loginController.toggleObscureText,
                  child: loginController.obscureText.value
                      ? const Icon(
                          Icons.visibility_off,
                        )
                      : const Icon(Icons.visibility)),
              prefixIcon: const Icon(
                FontAwesomeIcons.lock,
                size: 20.0,
              )),
          obscureText: loginController.obscureText.value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validPassowrdText;
            }
            if (isConfirm == true && confirmPassword!.text != value) {
              return validMatchPassText;
            }
            return null;
          },
        ),
      );
    });
  }
}
