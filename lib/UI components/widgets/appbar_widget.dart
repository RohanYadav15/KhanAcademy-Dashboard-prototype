import 'package:flutter/material.dart';
import 'package:khan_academy_dashboard/UI%20components/widgets/responsive_layout.dart';
import 'package:khan_academy_dashboard/utils/constants.dart';
import 'package:khan_academy_dashboard/utils/data.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.isTinyHeight(context) ||
            ResponsiveLayout.istiny(context)
        ? Container()
        : SafeArea(
            child: Container(
              height: 70.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              color: kSecondaryColor,
              child: Row(
                children: [
                  ResponsiveLayout.isComputer(context)
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                                radius: 20.0,
                                child:
                                    Image.asset('assets/images/khan_icon.png')),
                            SizedBox(
                              width: 10.0,
                            ),
                            OutlinedButton(
                                onPressed: () => null,
                                child: Text('Dashboard',
                                    style: TextStyle(
                                        color: kButtonColor,
                                        fontWeight: FontWeight.bold)))
                          ],
                        )
                      : IconButton(
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: Icon(Icons.menu)),
                  Spacer(),
                  ResponsiveLayout.isComputer(context)
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              dTitleButtonData.length,
                              (index) => Container(
                                    width: 70.0,
                                    height: 40.0,
                                    child: Column(
                                      children: [
                                        TextButton(
                                            onPressed: () => setState(
                                                () => activeIndex = index),
                                            child: Text(
                                              dTitleButtonData[index],
                                              style: TextStyle(
                                                  color: kButtonColor),
                                            )),
                                        if (activeIndex == index)
                                          Container(
                                            color: Colors.lightBlue
                                                .withOpacity(0.6),
                                            height: 5.0,
                                            width: double.infinity,
                                          ),
                                      ],
                                    ),
                                  )),
                        )
                      : TextButton(
                          onPressed: () => null,
                          child: Text('Dashboard',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: kButtonColor))),
                  Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.search, color: kButtonColor, size: 30.0),
                      SizedBox(width: 10.0),
                      Stack(alignment: Alignment.topRight, children: [
                        Icon(Icons.notifications, size: 30.0),
                        CircleAvatar(
                            radius: 6.0,
                            backgroundColor: Colors.red,
                            child: Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.white),
                            ))
                      ]),
                      SizedBox(width: 10.0),
                      if (!ResponsiveLayout.isPhone(context))
                        CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.purple,
                          child: Icon(Icons.person),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
