import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:ReUseMarket/model/homemodel/gadgets.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/homepage/home/widget/rating_widget.dart';

class ItemContainer extends StatelessWidget {
  final Gadgets gadget;
  const ItemContainer({super.key, required this.gadget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        Container(
          margin: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.5),
            //     spreadRadius: 2,
            //     blurRadius: 5,
            //     offset:
            //         const Offset(0, 3), // changes the position of the shadow
            //   ),
            // ],
            color: kwhiteColor,
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: GridTile(
            footer: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0)),
              child: GridTileBar(
                backgroundColor: Colors.white,
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("$rupee${10}",
                            style: TextStyle(
                              color: kblackColor,
                            )),
                        RatingWidget(
                          ownerEmail: gadget.email,
                          title: gadget.title,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: kblackColor,
                        ),
                        Text(gadget.city,
                            style: const TextStyle(
                              color: kblackColor,
                            )),
                      ],
                    ),
                  ],
                ),
                title: Text(
                  gadget.title,
                  style: const TextStyle(
                      color: kblackColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            child: Hero(
              tag: gadget.image1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: kgrey,
                  ),
                  width: 180.0,
                  height: 240.0,
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
        ),
      ],
    );
  }
}
