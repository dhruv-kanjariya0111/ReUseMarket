import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:ReUseMarket/model/homemodel/gadgets.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:shimmer/shimmer.dart';

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
            margin: const EdgeInsets.all(2),
            color: Colors.grey,
            child: GridTile(
              footer: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD9ECC7), // Background color of the container
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      gadget.title,
                      style: const TextStyle(
                        color: kblackColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      // Adjust the value as needed
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text("$rupee${gadget.weekPrice}",
                            style: const TextStyle(
                              color: kblackColor,
                            )),
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
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade400, // Customize base color
                        highlightColor:
                            Colors.grey.shade200, // Customize highlight color
                        child: Container(
                          color: Colors.white, // Background color
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
