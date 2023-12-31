import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;

  const ImageCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: kblackColor,
      ),
      child: Image.network(
        imageUrl,
        width: 300.0,
        height: 250.0,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: SizedBox(
                width: 300.0,
                height: 250.0,
                child: BlurHash(
                  imageFit: BoxFit.cover,
                  duration: const Duration(seconds: 4),
                  curve: Curves.bounceInOut,
                  hash: 'LHA-Vc_4s9ad4oMwt8t7RhXTNGRj',
                  image: imageUrl,
                ),
              ),
            );
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              color: kgrey,
              borderRadius: BorderRadius.circular(20.0),
            ),
            width: 300.0,
            height: 250.0,
            child: const Center(
              child: Icon(
                Icons.error,
                color: kwhiteColor,
                size: 30.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
