import 'package:ReUseMarket/view/splashscreen/welcome_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  final WelcomeController welcomeController = Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "asset/images/img12.png",
                height: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                "A perfect solution for both ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const Text(
                "Buyers and Sellers",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
