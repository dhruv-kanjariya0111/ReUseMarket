import 'package:ReUseMarket/view/core/appbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReUseMarket/controller/profile/fetch_profile_details.dart';
import 'package:ReUseMarket/main.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/logout_button.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/core/widgets.dart';
import 'package:ReUseMarket/view/homepage/profile/screens/edit_profile_screen.dart';
import 'package:ReUseMarket/view/homepage/profile/widget/listtile_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:ReUseMarket/view/homepage/profile/screens/address_screen/saved_addresses.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static ProfileControl profile = ProfileControl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarWidget(title: AppLocalizations.of(context)!.account),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: profile.docRef
              .doc(FirebaseAuth.instance.currentUser!.email.toString())
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(wrongText),
              );
            }
            if (snapshot.hasData) {
              DocumentSnapshot<Map<String, dynamic>>? querySnapshot =
                  snapshot.data;
              Map<String, dynamic>? data = querySnapshot!.data();
              print(data);

              //var data = snapshot.data!.data();
              // if (data==null) {
              //   print(data.toString());
              //   return const Center(
              //   child: Text(wrongText),
              // );
              // }

              return SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    decoration: boxDecoration,
                    child: Column(
                      children: [
                        kheight20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              // AppLocalizations.of(context)!.hello.toUpperCase(),
                              'Hello ,'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(0xFF07A3B2),
                                  fontWeight: FontWeight.bold),
                            ),
                            kwidth10,
                            Flexible(
                              child: Text(
                                data != null
                                    ? data[nameInMapText]
                                    : nameNullText,
                                // overflow: TextOverflow.fade,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: kblackColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        kheight10,

                        Text(
                          (data != null && data[emailInMapText] != null)
                              ? data[emailInMapText]
                              : FirebaseAuth.instance.currentUser?.email ??
                                  "", // Using safe navigation here
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: kblackColor,
                          ),
                        ),
                        kheight20,
                        // SizedBox(
                        //   width: 230.0,
                        //   child: ElevatedButton(
                        //       onPressed: () {
                        //         Get.to(() => const EditProfile());
                        //       },
                        //       style: ElevatedButton.styleFrom(
                        //           backgroundColor: Color(0xFF07A3B2),
                        //           side: BorderSide.none,
                        //           shape: const StadiumBorder()),
                        //       child: Text(
                        //         AppLocalizations.of(context)!.editProfile,
                        //         maxLines: 1,
                        //         style: const TextStyle(
                        //             color: Color(0xFFD9ECC7),
                        //             fontWeight: FontWeight.bold),
                        //       )),
                        // ),
                        kheight20,
                        Container(
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            border: Border.all(
                              width: 3,
                              color: Colors.grey,
                            ),
                          ),
                          child: ListTileWidget(
                            title: AppLocalizations.of(context)!.editProfile,
                            icon: Icons.location_on,
                            onTap: () {
                              Get.to(() => const EditProfile());
                            },
                          ),
                        ),
                        kheight20,

                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            border: Border.all(
                              width: 3,
                              color: Colors.grey,
                            ),
                          ),
                          child: ListTileWidget(
                            title: AppLocalizations.of(context)!.savedAddresses,
                            icon: Icons.location_on,
                            onTap: () {
                              Get.to(() => const SavedAddresses());
                            },
                          ),
                        ),
                        // ListTileWidget(
                        //   title: AppLocalizations.of(context)!.myGadget,
                        //   icon: Icons.local_grocery_store_rounded,
                        //   onTap: () {
                        //     Get.to(() => const MyGadgetsScreen());
                        //   },
                        // ),
                        // kheight20,
                        // ListTileWidget(
                        //   title: AppLocalizations.of(context)!.selectLanguage,
                        //   icon: Icons.assignment,
                        //   onTap: () {
                        //     Get.to(() => const SelectLanguageScreen());
                        //   },
                        // ),
                        // ListTileWidget(
                        //   title: AppLocalizations.of(context)!.myBookings,
                        //   icon: Icons.menu_book_outlined,
                        //   onTap: () {
                        //     Get.to(() => const MyBookingScreen());
                        //   },
                        // ),
                        // kheight20,

                        // kheight20,
                        // ListTileWidget(
                        //   title: AppLocalizations.of(context)!.termsAndPolicies,
                        //   icon: Icons.assignment,
                        //   onTap: () {
                        //     Get.to(() => const TermsAndPoliciesScreen());
                        //   },
                        // ),
                        // kheight20,
                        // ListTileWidget(
                        //   title: AppLocalizations.of(context)!.about,
                        //   icon: Icons.info,
                        //   onTap: () {
                        //     showDialog(
                        //       context: context,
                        //       builder: (context) {
                        //         return const AboutUsWidget();
                        //       },
                        //     );
                        //   },
                        // ),
                        kheight20,
                        kheight20,
                        const LogoutButton()
                      ],
                    )),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
              );
            }
          }),
    );
  }
}
