import 'package:flutter/material.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/loginpage/widgets/header_section.dart';
import 'package:ReUseMarket/view/loginpage/widgets/login_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 50),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              // begin: Alignment.topRight,
              // end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 252, 171, 200),
                Color.fromARGB(255, 136, 144, 255)
              ],
            ),
          ),
          child: Column(
            children: [
              const HeaderSection(
                title: logintext,
                subtitle: welcomeBack,
              ),
              const SizedBox(
                height: 70,
              ),
              LoginSection(),
            ],
          ),
        ),
      ),
    );
  }
}
