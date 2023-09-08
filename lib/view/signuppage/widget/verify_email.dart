import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ReUseMarket/controller/signout/signout_function.dart';
import 'package:ReUseMarket/controller/signup/verify_function.dart';
import 'package:ReUseMarket/view/core/appbar_widget.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/core/widgets.dart';
import 'package:ReUseMarket/view/homepage/home_page.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail(setState: setState, canResendEmail: canResendEmail);
      timer = Timer.periodic(const Duration(seconds: 3), (_) {
        checkEmailVerified(
            context: context,
            isEmailVerified: isEmailVerified,
            setState: setState,
            timer: timer);
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? const MainScreen()
        : Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: AppBarWidget(title: appName)),
            body: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'A verification email has been sent to your email',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  kheight20,
                  ElevatedButton.icon(
                    onPressed: () {
                      canResendEmail ? sendVerificationEmail(setState: setState, canResendEmail: canResendEmail) : null;
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kOrange900,
                        minimumSize: const Size.fromHeight(50)),
                    icon: const Icon(Icons.mail),
                    label: const Text("Resend Email"),
                  ),
                  kheight20,
                  TextButton(
                      onPressed: () {
                        timer?.cancel();
                        signOutFunc(context: context);
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50)),
                      child: const Text(
                        cancelText,
                        style: TextStyle(fontSize: 15.0),
                      ))
                ],
              ),
            )));
  }
}
