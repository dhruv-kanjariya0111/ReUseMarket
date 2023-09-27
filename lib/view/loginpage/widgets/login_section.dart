import 'package:ReUseMarket/view/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/model/loginmodel/mobx/login_mobx.dart';
import 'package:ReUseMarket/view/core/button_widget.dart';
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
  LoginSection({super.key});
  final loginFormKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(100.0),
        ),
      ),
      child: Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailField(
              emailController: loginController.emailController.value,
            ),
            const SizedBox(height: 20),
            PasswordField(
              passwordController: loginController.passwordController.value,
            ),
            kheight20,
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ForgotPasswordScreen(),
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
                    },
                    child: const SignInContainer())
              ],
            ),
            kheight20,
            const Text(noAccountText),
            TextButton(
              onPressed: () {
                Get.to(SignUpScreen());
              },
              child: const Text('Sign Up Here'),
            ),
          ],
        ),
      ),
    );
  }
}
