import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  const CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        //vertical: 15.0,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            Colors.grey.shade200,
            Colors.yellow.shade100,
            Colors.grey.shade200,

            Colors.white,
            Colors.grey.shade200,

            Colors.red.shade100,
            Colors.grey.shade200,

            Colors.white,
            Colors.grey.shade200,

            // Colors.blue.shade100,
            Colors.purple.shade100,
            Colors.grey.shade200,

            Colors.white,
            Colors.grey.shade200,

            // Colors.green.shade100,
          ],
        ),
      ),
      child: child,
    );
  }
}
