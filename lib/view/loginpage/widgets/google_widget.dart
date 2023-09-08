import 'package:flutter/material.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInContainer extends StatelessWidget {
  const SignInContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 200.0,
      decoration: BoxDecoration(
          color: Color(0xFF07A3B2),
          boxShadow: [
            BoxShadow(
              color: kblackColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes the position of the shadow
            ),
          ],
          borderRadius: BorderRadius.circular(20.0)),
      child: Icon(
        FontAwesomeIcons.google,
        color: Color(0xFFD9ECC7),
      ),
    );
  }
}
