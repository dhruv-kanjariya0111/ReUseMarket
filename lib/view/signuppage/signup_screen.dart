import 'package:flutter/material.dart';
import 'package:ReUseMarket/controller/signup/signup_function.dart';
import 'package:ReUseMarket/model/signupmodel/mobx/signup_model.dart';
import 'package:ReUseMarket/view/core/button_widget.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/core/widgets.dart';
import 'package:ReUseMarket/view/loginpage/widgets/fields.dart/email_field.dart';
import 'package:ReUseMarket/view/loginpage/widgets/fields.dart/password_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:ReUseMarket/view/loginpage/widgets/header_section.dart';
import 'package:ReUseMarket/view/signuppage/widget/country_code_widget.dart';

Country country = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "");

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static final SignUpModel signupmodel = SignUpModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF07A3B2), Color(0xFFD9ECC7)],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Navigate to the previous screen
                  },
                ),
                SizedBox(
                  width: 65,
                ),
                HeaderSection(
                  title: signupText.toUpperCase(),
                  subtitle: welcomText,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: kwhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(130.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Form(
                      key: signupmodel.signupformKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120,
                          ),
                          TextFormField(
                            controller: signupmodel.fullnameController,
                            decoration: const InputDecoration(
                              label: Text(fullnameText),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.person,
                                size: 20.0,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return validNameText;
                              }
                              return null;
                            },
                          ),
                          kheight20,
                          TextFormField(
                            controller: signupmodel.numberController,
                            decoration: const InputDecoration(
                                label: Text(numberText),
                                border: OutlineInputBorder(),
                                prefixIcon: CountryCodeWidget()),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length != 10) {
                                return validNumberText;
                              }
                              return null;
                            },
                          ),
                          kheight10,
                          EmailField(
                              emailController: signupmodel.emailController),
                          kheight10,
                          PasswordField(
                              passwordController:
                                  signupmodel.passwordController),
                          kheight10,
                          PasswordField(
                            passwordController:
                                signupmodel.confirmpasswordController,
                            isConfirm: true,
                            confirmPassword: signupmodel.passwordController,
                          ),
                          kheight10,
                          ButtonWidget(
                            text: "Verify",
                            onpressed: (context) async {
                              final isValid = signupmodel
                                  .signupformKey.currentState!
                                  .validate();
                              if (!isValid) return;

                              await signUp(
                                  context: context,
                                  email:
                                      signupmodel.emailController.text.trim(),
                                  password: signupmodel.passwordController.text
                                      .trim());
                              await userSignupDetailsToFireStore(
                                  email:
                                      signupmodel.emailController.text.trim(),
                                  name: signupmodel.fullnameController.text
                                      .trim(),
                                  password: signupmodel.passwordController.text
                                      .trim(),
                                  phoneNumber:
                                      signupmodel.numberController.text.trim());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
