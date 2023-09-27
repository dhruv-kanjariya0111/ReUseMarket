import 'package:ReUseMarket/view/homepage/home_page.dart';
import 'package:ReUseMarket/view/loginpage/login_screen.dart';
import 'package:ReUseMarket/view/signuppage/widget/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  @override
  void onInit() {
    _redirectAfterDelay(); // Call the redirection function without await
  }

  Future<void> _redirectAfterDelay() async {
    User? user = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(seconds: 3));

    if (user != null) {
      if (!user.emailVerified) {
        Get.offAll(() => const VerifyEmailScreen());
      } else {
        Get.offAll(() => const MainScreen());
      }
    } else {
      Get.offAll(() => const LoginPage());
    }
  }
}
