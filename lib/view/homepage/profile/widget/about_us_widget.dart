import 'package:flutter/material.dart';
import 'package:ReUseMarket/view/core/widgets.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Row(
          children: [
            const Text('About '),
            SizedBox(
              height: 40.0,
              width: 40.0,
              child: Image.asset(
                "asset/images/img12.png",
              ),
            ),
            const Text('ReUseMarket'),
          ],
        ),
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ReUseMarket is a rental app where you can post your rental gadgets for rent and other users can rent them.',
                    ),
                    kheight10,
                    const Text(
                      'Version: 1.0.0',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    kheight10,
                    Row(
                      children: const [
                        Text(
                          'Developed by :',
                        ),
                        kwidth10,
                        Text(
                          "Dhruv Kanjariya",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ]))
        ]);
  }
}
