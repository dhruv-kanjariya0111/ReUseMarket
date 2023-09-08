import 'package:ReUseMarket/view/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/model/loginmodel/mobx/login_mobx.dart';
import 'package:ReUseMarket/view/core/button_widget.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/core/widgets.dart';
import 'package:ReUseMarket/controller/signin/login_functions.dart';
import 'package:ReUseMarket/controller/signin/signin_google.dart';
import 'package:ReUseMarket/view/loginpage/widgets/fields.dart/email_field.dart';
import 'package:ReUseMarket/view/loginpage/widgets/fields.dart/password_field.dart';
import 'package:ReUseMarket/view/loginpage/widgets/forgotpswd_screen.dart';
import 'package:ReUseMarket/view/loginpage/widgets/google_widget.dart';
import 'package:ReUseMarket/view/signuppage/signup_screen.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});
  static final loginFormKey = GlobalKey<FormState>();
  static LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: kwhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(130.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailField(
                    emailController: loginController.emailController.value),
                kheight20,
                PasswordField(
                  passwordController: loginController.passwordController.value,
                ),
                kheight20,
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ));
                    },
                    child: const Text(
                      forgotpassText,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xFF07A3B2),
                          decoration: TextDecoration.underline),
                    )),
                kheight20,
                ButtonWidget(
                  text: logintext,
                  onpressed: (context) {
                    final isValid = loginFormKey.currentState!.validate();
                    if (!isValid) return;
                    signIn(
                        context: context,
                        email: loginController.emailController.value,
                        password: loginController.passwordController.value);
                  },
                ),
                kheight10,
                kDivider(
                  context,
                ),
                kheight10,
                const Text('OR'),
                const Text(signinWithText),
                kheight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () async {
                          await siginInWithGoogle(context: context);
                          Get.to(MainScreen());
                        },
                        child: const SignInContainer())
                  ],
                ),
                kheight20,
                const Text(noAccountText),
                TextButton(
                  onPressed: () {
                    Get.to(const SignUpScreen());
                  },
                  child: const Text('Sign Up Here'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
