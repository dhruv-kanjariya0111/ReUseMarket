import 'package:ReUseMarket/view/homepage/home_page.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/view/signuppage/widget/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:ReUseMarket/view/loginpage/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    // final welcomeController = Get.put(WelcomeController());

    return Scaffold(
      body: SafeArea(
        child: Center(
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
                // custom button
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF07A3B2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      User? user = FirebaseAuth.instance.currentUser;

                      if (user != null) {
                        if (!user.emailVerified) {
                          // If the user's email is not verified, show the VerifyEmailScreen
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const VerifyEmailScreen(),
                          //   ),
                          // );
                          Get.to(() => const VerifyEmailScreen());
                        } else {
                          // If the user's email is verified, navigate to the main content
                          // You can replace MainPage with your actual main content page
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => MainScreen()),
                          // );
                          Get.to(() => const MainScreen());
                        }
                      } else {
                        // If no user is logged in, navigate to the LoginPage
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => LoginPage()),
                        // );
                        Get.off(() => const LoginPage());
                      }
                      ;
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(color: Color(0xFFD9ECC7), fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
