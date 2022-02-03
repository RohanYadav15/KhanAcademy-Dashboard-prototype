import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:khan_academy_dashboard/UI%20components/widgets/appbar_widget.dart';

import 'package:khan_academy_dashboard/UI%20components/widgets/drawer.dart';
import 'package:khan_academy_dashboard/UI%20components/widgets/responsive_layout.dart';
import 'package:khan_academy_dashboard/UI%20components/widgets/responsive_scroll_column.dart';
import 'package:khan_academy_dashboard/utils/constants.dart';
import 'package:khan_academy_dashboard/utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(),
        preferredSize: Size(double.maxFinite, 80.0),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: ResponsiveColumn(size: Sizes.phone, selectedIndex: currentIndex),
        tablet: ResponsiveColumn(size: Sizes.tablet),
        largeTablet: ResponsiveColumn(size: Sizes.computer),
        computer: Row(
          children: [
            Expanded(flex: 1, child: DrawerWidget()),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    color: kSecondaryColor,
                    child: Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(36.0)),
                          color: kPrimaryColor),
                    ),
                  ),
                  ResponsiveColumn(size: Sizes.computer),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              color: kRetroColors2[0],
              backgroundColor: kPrimaryColor,
              buttonBackgroundColor: kSecondaryColor,
              index: currentIndex,
              items: [
                Icon(Icons.home, color: kButtonColor),
                Icon(Icons.dashboard, color: kButtonColor),
                Icon(Icons.access_time_filled_sharp, color: kButtonColor),
              ],
              onTap: (value) => setState(() => currentIndex = value))
          : SizedBox(),
    );
  }
}
