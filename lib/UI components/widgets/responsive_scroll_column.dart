import 'package:flutter/material.dart';
import 'package:khan_academy_dashboard/UI%20components/widgets/task_tile.dart';
import 'package:khan_academy_dashboard/utils/constants.dart';
import 'package:khan_academy_dashboard/utils/data.dart';
import 'package:khan_academy_dashboard/utils/enums.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'charts.dart';

final List<Widget> row1 = [
  Container(
    width: 200.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0), color: kSecondaryColor),
    child: ListTile(
      title: Text(
        'Tests Given',
        style: kLabelTextStyle,
      ),
      trailing: Chip(
        label: Text('8/10'),
        elevation: 4.0,
      ),
    ),
  ),
  Container(
    width: 200.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0), color: kSecondaryColor),
    child: ListTile(
      title: Text(
        'Highest',
        style: kLabelTextStyle,
      ),
      trailing: Chip(label: Text('1580')),
    ),
  ),
  Container(
    width: 200.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0), color: kSecondaryColor),
    child: ListTile(
      title: Text(
        'Lowest',
        style: kLabelTextStyle,
      ),
      trailing: Chip(label: Text('840')),
    ),
  ),
];

final List<Widget> row2 = [
  Expanded(
    flex: 3,
    child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        margin: EdgeInsets.all(8.0),
        elevation: 8.0,
        color: kSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BarChartSample1(),
        )),
  ),
  Expanded(
    flex: 2,
    child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        margin: EdgeInsets.all(8.0),
        elevation: 8.0,
        color: kSecondaryColor,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: PercentIndicatorSample1())),
  ),
  Expanded(
    flex: 2,
    child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        margin: EdgeInsets.all(8.0),
        elevation: 8.0,
        color: kSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: PercentIndicatorSample2(),
        )),
  ),
];

final List<Widget> row3 = [
  Expanded(
    flex: 2,
    child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        margin: EdgeInsets.all(8.0),
        elevation: 8.0,
        color: kSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: LineChartSample1(),
        )),
  ),
  Expanded(
    flex: 2,
    child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        margin: EdgeInsets.all(8.0),
        elevation: 8.0,
        color: kSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: List.generate(
                dMilestones.length,
                (index) => MilestonesIndicator(
                    name: dMilestones[index][0],
                    percentage: dMilestones[index][1],
                    lineColor: kRetroColors1[index])),
          ),
        )),
  ),
  Expanded(
    flex: 2,
    child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        margin: EdgeInsets.all(8.0),
        elevation: 8.0,
        color: kSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: dTasks
                .map((e) => TaskTile(taskName: e[0], taskSubtitle: e[1]))
                .toList(),
          ),
        )),
  ),
];

class ResponsiveColumn extends StatelessWidget {
  ResponsiveColumn({required this.size, this.selectedIndex = 0});
  final Sizes size;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: size == Sizes.phone
                ? [row1[selectedIndex]]
                : size == Sizes.tablet
                    ? row1.getRange(0, 2).toList()
                    : row1,
          ), //Row 1 here,
          Row(
            children: size == Sizes.phone
                ? getSecondRowPhone()
                : size == Sizes.tablet
                    ? row2.getRange(0, 2).toList()
                    : row2,
          ), //Row 2 here

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: size == Sizes.phone
                ? [row3[selectedIndex]]
                : size == Sizes.tablet
                    ? row3.getRange(0, 2).toList()
                    : row3,
          ), //Row 3 here
        ],
      ),
    );
  }

  List<Widget> getSecondRowPhone() {
    List<Widget> widgets = [];
    if (selectedIndex == 0)
      widgets.add(row2[0]);
    else if (selectedIndex == 1) widgets.addAll([row2[1], row2[2]]);
    return widgets;
  }
}

class HeaderTile extends StatelessWidget {
  final String title;
  final String trailing;
  const HeaderTile({Key? key, required this.title, required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
