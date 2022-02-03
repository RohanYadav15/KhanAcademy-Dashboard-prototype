import 'package:flutter/material.dart';
import 'package:khan_academy_dashboard/utils/constants.dart';
import 'package:khan_academy_dashboard/utils/data.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Khan Academy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: kButtonColor,
                fontSize: 36.0,
              ),
            ),
            height: 150,
            width: double.maxFinite,
          )
        ]..addAll(List.generate(
            dDrawerItemsData.length,
            (index) => ListTile(
                  tileColor: kSecondaryColor,
                  title: Text(
                    dDrawerItemsData[index][0],
                    style: kLabelTextStyle,
                  ),
                  leading: Icon(
                    dDrawerItemsData[index][1],
                    color: kButtonColor,
                  ),
                ))),
      ),
    );
  }
}
