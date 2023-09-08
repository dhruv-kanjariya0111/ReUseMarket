import 'package:flutter/material.dart';

import 'package:ReUseMarket/view/core/const_colors.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final double? height;
  const ListTileWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          alignment: Alignment.center,
          height: height ?? MediaQuery.of(context).size.height / 13,
          decoration: const BoxDecoration(color: kwhiteColor, boxShadow: [
            BoxShadow(color: kblackColor, blurRadius: 5.0),
          ]),
          child: ListTile(
            onTap: onTap,
            title: Text(title),
            leading: Icon(
              icon,
              size: 30,
              color: Color(0xFF07A3B2),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        ),
      ),
    );
  }
}
