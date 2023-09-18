import 'package:flutter/material.dart';
import 'package:ReUseMarket/view/core/const_colors.dart';
import 'package:ReUseMarket/view/core/string_consts.dart';
import 'package:ReUseMarket/view/homepage/home/widget/streambuilder_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: allCategories(context: context).length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.blueGrey[200],
          //Colors.orange[900],
          toolbarHeight: 0.0,
          bottom: TabBar(
            indicatorSize:
                TabBarIndicatorSize.tab, // This can be set to `tab` or `label`
            indicator: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(30), // Customize the indicator shape
              color: Color.fromARGB(255, 255, 255, 255), // Custom
            ), //
            isScrollable: true,
            labelColor: Color(0xFF07A3B2),
            labelStyle: kTextStyle,
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: unselectedTextStyle,
            tabs: List.generate(
              allCategories(context: context).length,
              (index) => Tab(
                child: Text(
                  allCategories(context: context)[index],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            allCategories(context: context).length,
            (index) => StreamBuilderWidget(category: allcategories[index]),
          ),
        ),
      ),
    );
  }
}
