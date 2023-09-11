import 'package:ReUseMarket/main.dart';
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
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 218, 217, 217),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            width: 300,
            child: Hero(
              tag: gadget.image1,
              child: Image.network(
                gadget.image1,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: BlurHash(
                        imageFit: BoxFit.contain,
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
          Container(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 206, 201, 201)),
            padding: EdgeInsets.only(left: 10),

            // color: Color.fromARGB(198, 255, 255, 255),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$rupee${10}",
                      style: TextStyle(color: kblackColor, fontSize: 20),
                    ),

                    // RatingWidget(
                    //   ownerEmail: gadget.email,
                    //   title: gadget.title,
                    // )
                  ],
                ),
                Text(
                  gadget.title,
                  style: const TextStyle(
                      color: kblackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
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
          ),
        ],
      ),
    );

    // return Stack(
    //   children: [
    //     Card(
    //       elevation: 0,
    //       margin: const EdgeInsets.all(5),
    //       color: Colors.grey,
    //       child: GridTile(
    //         footer: GridTileBar(
    //           backgroundColor: const Color.fromARGB(199, 158, 158, 158),
    //           subtitle: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     "$rupee${10}",
    //                     style: TextStyle(color: kblackColor, fontSize: 16),
    //                   ),
    //                   // RatingWidget(
    //                   //   ownerEmail: gadget.email,
    //                   //   title: gadget.title,
    //                   // )
    //                 ],
    //               ),
    //               Row(
    //                 children: [
    //                   const Icon(
    //                     Icons.location_on,
    //                     color: kblackColor,
    //                   ),
    //                   Text(gadget.city,
    //                       style: const TextStyle(
    //                         color: kblackColor,
    //                       )),
    //                 ],
    //               ),
    //             ],
    //           ),
    //           title: Text(
    //             gadget.title,
    //             style: const TextStyle(
    //                 color: kblackColor,
    //                 fontSize: 15.0,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //         child: Hero(
    //           tag: gadget.image1,
    //           child: Image.network(
    //             gadget.image1,
    //             fit: BoxFit.cover,
    //             loadingBuilder: (context, child, loadingProgress) {
    //               if (loadingProgress == null) {
    //                 return child;
    //               } else {
    //                 return Center(
    //                   child: BlurHash(
    //                     imageFit: BoxFit.cover,
    //                     duration: const Duration(seconds: 4),
    //                     curve: Curves.bounceInOut,
    //                     hash: 'LHA-Vc_4s9ad4oMwt8t7RhXTNGRj',
    //                     image: gadget.image1,
    //                   ),
    //                 );
    //               }
    //             },
    //             errorBuilder: (context, error, stackTrace) {
    //               return const Center(
    //                 child: Icon(
    //                   Icons.error,
    //                   color: kwhiteColor,
    //                   size: 25.0,
    //                 ),
    //               );
    //             },
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
