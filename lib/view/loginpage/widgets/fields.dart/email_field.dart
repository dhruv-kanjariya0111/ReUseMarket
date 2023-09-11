import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(83, 158, 158, 158),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: emailController,
        decoration: const InputDecoration(
          label: Text(mailText),
          // border: OutlineInputBorder(),
          border: InputBorder.none,
          prefixIcon: Icon(
            FontAwesomeIcons.envelope,
            size: 20.0,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value != null && !EmailValidator.validate(value)) {
            return validEmailText;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
