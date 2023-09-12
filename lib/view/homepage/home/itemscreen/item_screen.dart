import 'package:ReUseMarket/view/chats/message_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/controller/update/update_item.dart';
import 'package:ReUseMarket/model/homemodel/gadgets.dart';
import 'package:ReUseMarket/view/core/appbar_widget.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/screen_container_widget.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/core/widgets.dart';
import 'package:ReUseMarket/view/homepage/home/itemscreen/widget/image_card.dart';

class ItemScreen extends StatelessWidget {
  final String doc;
  final Gadgets gadget;
  const ItemScreen({
    super.key,
    required this.doc,
    required this.gadget,
  });
  static final updateGadget = UpdateController();

  @override
  Widget build(BuildContext context) {
    String text = gadget.details;
    List<String> lines = text.split('\n');
    String bulletText = '';
    for (String line in lines) {
      bulletText += '\u2022 $line\n';
    }
    bool isOwner = false;

    if (gadget.email == FirebaseAuth.instance.currentUser!.email) {
      isOwner = true;
    }
    print('${updateGadget.data['name']}');
    updateGadget.assignData();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(title: appName),
      ),
      body: CustomContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // kheight20,
              kheight20,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Hero(
                        tag: gadget.image1,
                        child: ImageCard(imageUrl: gadget.image1)),
                    kwidth10,
                    ImageCard(imageUrl: gadget.image2),
                    kwidth10,
                    ImageCard(imageUrl: gadget.image3)
                  ],
                ),
              ),
              kheight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(gadget.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: kblackColor, fontWeight: FontWeight.bold)),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Price\n",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: kblackColor,
                                    fontWeight: FontWeight.bold)),
                        TextSpan(
                            // text: "₹${gadget.dayPrice}/day",
                            text: "₹${10}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: kblackColor,
                                    fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  // RatingWidget(ownerEmail: gadget.email, title: gadget.title)
                ],
              ),
              kheight10,
              kDivider(context),
              kheight10,
              Text(
                "Product's Description",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: kblackColor, fontWeight: FontWeight.bold),
              ),
              kheight10,
              Text(
                bulletText,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: kblackColor,
                    ),
              ),
              kheight10,
              kDivider(context),
              kheight10,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Owner's info",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: kblackColor,
                        ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Name : ' + gadget.name,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: kblackColor,
                                ),
                      ),
                      subtitle: Text(
                        'Mail : ' + gadget.email,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: kblackColor,
                                ),
                      ),
                    ),
                  ),
                  kheight20,
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MessageScreen(
                            recieverEmail: gadget.email,
                            recieverName: gadget.name,
                            senderName: updateGadget.data['name'],
                          ),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          // fixedSize: const Size(300, 40),
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          side: const BorderSide(width: 2, color: kwhiteColor),
                          shape: const StadiumBorder()),
                      child: const Text(
                        "Click Here to Message",
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              kheight10,
              kheight20,

              // Text(
              //   "Reviews",
              //   style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              //         color: kblackColor,
              //         fontWeight: FontWeight.bold,
              //       ),
              // ),
              // kheight10,
              // ReviewWidget(
              //   ownerEmail: gadget.email,
              //   title: gadget.title,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingButton extends StatelessWidget {
  final VoidCallback onpressed;
  final Color? color;
  final String text;
  const BookingButton(
      {super.key,
      required this.onpressed,
      required this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 230.0,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            side: BorderSide.none,
            shape: const StadiumBorder()),
        child: Text(
          text.toUpperCase(),
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: kwhiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
