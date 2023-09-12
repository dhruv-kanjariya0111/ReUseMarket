import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:ReUseMarket/model/homemodel/gadgets.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';

class ItemContainer extends StatelessWidget {
  final Gadgets gadget;
  const ItemContainer({super.key, required this.gadget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.all(0),
            color: Colors.grey,
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.amber[100],
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "$rupee${10}",
                          style: TextStyle(color: kblackColor, fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: kblackColor,
                        ),
                        Text(
                          gadget.city,
                          style: const TextStyle(
                            color: kblackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                title: Text(
                  gadget.title,
                  style: const TextStyle(
                    color: kblackColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              child: Hero(
                tag: gadget.image1,
                child: Image.network(
                  gadget.image1,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: BlurHash(
                          imageFit: BoxFit.cover,
                          duration: const Duration(seconds: 4),
                          curve: Curves.bounceInOut,
                          hash: 'LHA-Vc_4s9ad4oMwt8t7RhXTNGRj',
                          image: gadget.image1,
                        ),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.error,
                        color: kwhiteColor,
                        size: 25.0,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
