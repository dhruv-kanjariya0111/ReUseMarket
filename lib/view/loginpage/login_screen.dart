import 'package:flutter/material.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/loginpage/widgets/header_section.dart';
import 'package:ReUseMarket/view/loginpage/widgets/login_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // begin: Alignment.topRight,
            // end: Alignment.bottomLeft,
            colors: [Color(0xFF07A3B2), Color(0xFFD9ECC7)],
          ),
        ),
        child: const SafeArea(
          child: Column(
            children: [
              HeaderSection(
                title: logintext,
                subtitle: welcomeBack,
              ),
              LoginSection()
            ],
          ),
        ),
      ),
    );
  }
}
