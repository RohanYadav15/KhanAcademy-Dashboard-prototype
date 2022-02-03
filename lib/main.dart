import 'package:flutter/material.dart';
import 'package:khan_academy_dashboard/UI%20components/screens/home_screen.dart';
import 'package:khan_academy_dashboard/utils/constants.dart';

void main() {
  runApp(KhanDashboard());
}

class KhanDashboard extends StatelessWidget {
  const KhanDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            side: BorderSide(color: kButtonColor, width: 2.0),
          )),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            textStyle: TextStyle(color: kTextColor),
          )),
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryColor,
          canvasColor: kSecondaryColor,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: kTextColor),
            button: TextStyle(color: kTextColor),
          )),
      home: HomeScreen(),
    );
  }
}
