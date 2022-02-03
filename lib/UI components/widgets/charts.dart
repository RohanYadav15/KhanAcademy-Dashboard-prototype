import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:khan_academy_dashboard/utils/constants.dart';
import 'package:khan_academy_dashboard/utils/data.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BarChartSample1 extends StatefulWidget {
  const BarChartSample1({Key? key}) : super(key: key);

  @override
  _BarChartSample1State createState() => _BarChartSample1State();
}

class _BarChartSample1State extends State<BarChartSample1> {
  final actualData = List.generate(
    dTestsData.length,
    (index) => BarChartGroupData(
      x: index + 1,
      barRods: [
        BarChartRodData(y: dTestsData[index][1], colors: [Colors.lightBlue]),
        BarChartRodData(y: dTestsData[index][2], colors: [Colors.pink]),
      ],
    ),
  );

  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          barGroups: List.generate(dTestsData.length, (index) {
            double y1 = dTestsData[index][1];
            double y2 = dTestsData[index][2];
            double average = (y1 + y2) / 2;
            return BarChartGroupData(
              x: index + 1,
              barRods: [
                BarChartRodData(
                    y: selectedIndex == index ? average : y1,
                    colors: [Colors.lightBlue]),
                BarChartRodData(
                    y: selectedIndex == index ? average : dTestsData[index][2],
                    colors: [Colors.pink]),
              ],
            );
          }),
          titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                  getTextStyles: (value) => kTitleTextStyle,
                  showTitles: true,
                  getTitles: (value) {
                    return 'Test ' + value.toInt().toString();
                  }),
              leftTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => kTitleTextStyle,
                  getTitles: (value) {
                    if (value % 40 == 0.0) {
                      return value.toInt().toString();
                    } else {
                      return '';
                    }
                  })),
          barTouchData: BarTouchData(
              enabled: true,
              touchCallback: (response) {
                if (response.spot == null) {
                  setState(() {
                    selectedIndex = -1;
                  });

                  return;
                }
                setState(() {
                  if (response.touchInput is PointerExitEvent ||
                      response.touchInput is PointerUpEvent) {
                    selectedIndex = -1;
                  } else {
                    selectedIndex = response.spot!.touchedBarGroupIndex;
                  }
                });
              }),
          minY: 400.0,
          maxY: 800.0,
        ),
        swapAnimationDuration: Duration(milliseconds: 450),
        swapAnimationCurve: Curves.easeOut,
      ),
    );
  }
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({Key? key}) : super(key: key);

  @override
  _LineChartSample1State createState() => _LineChartSample1State();
}

class _LineChartSample1State extends State<LineChartSample1> {
  bool isAvg = false;

  List<FlSpot> spots = List.generate(
      dTestsData.length,
      (index) => FlSpot(
          index.toDouble() + 1, dTestsData[index][1] + dTestsData[index][2]));

  double getAverage() {
    double total = 0.0;
    spots.forEach((element) {
      total += element.y;
    });
    return total / 8;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () => setState(() => isAvg = !isAvg),
            child: Text(
              'Average',
              style: TextStyle(
                  color: isAvg ? kButtonColor.withOpacity(.6) : kButtonColor,
                  fontSize: 16.0),
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    colors: [kRetroColors2[0], kRetroColors2[2]],
                    isStrokeCapRound: true,
                    barWidth: 5.0,
                    belowBarData: BarAreaData(show: true, colors: [
                      kRetroColors2[0].withOpacity(0.4),
                      kRetroColors2[0].withOpacity(0.6),
                    ]),
                    dotData: FlDotData(show: false),
                    spots: isAvg
                        ? spots.map((e) => e.copyWith(y: getAverage())).toList()
                        : spots,
                    isCurved: true,
                  ),
                ],
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) =>
                        kTitleTextStyle.copyWith(fontSize: 12.0),
                    getTitles: (value) => 'Test ' + value.toInt().toString(),
                    interval: 1.5,
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => kTitleTextStyle,
                    getTitles: (value) => value.toInt().toString(),
                    interval: 50.0,
                  ),
                ),
                axisTitleData: FlAxisTitleData(
                    leftTitle: AxisTitle(
                      showTitle: true,
                      titleText: 'Total score -->',
                      textStyle: kLabelTextStyle,
                      margin: 4.0,
                    ),
                    bottomTitle: AxisTitle(
                      showTitle: true,
                      titleText: 'Practice Tests -->',
                      textStyle: kLabelTextStyle,
                      margin: 4.0,
                    )),
                borderData: FlBorderData(show: false),
                maxX: 8.0,
                minX: 1.0,
                maxY: 1600.0,
                minY: 800.0,
              ),
              swapAnimationDuration: Duration(
                milliseconds: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PercentIndicatorSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: CircularPercentIndicator(
          radius: 170.0,
          animationDuration: 2500,
          animation: true,
          percent: 0.824,
          backgroundColor: kPrimaryColor.withOpacity(0.7),
          rotateLinearGradient: true,
          center: Text(
            '82.4%\nDone',
            style: TextStyle(
                color: kButtonColor,
                fontSize: 32.0,
                fontWeight: FontWeight.bold),
          ),
          footer: Text(
            'Maths',
            style: TextStyle(
                color: kButtonColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic),
          ),
          lineWidth: 16.0,
          linearGradient: LinearGradient(
              colors: [Colors.lightBlue, Colors.lightBlue.withOpacity(0.5)]),
        ),
      ),
    );
  }
}

class PercentIndicatorSample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: CircularPercentIndicator(
          curve: Curves.easeInCubic,
          linearGradient: LinearGradient(
            colors: [Colors.pink, Colors.pink.withOpacity(0.5)],
          ),
          lineWidth: 16.0,
          animationDuration: 2500,
          animation: true,
          backgroundColor: kPrimaryColor.withOpacity(0.6),
          radius: 170.0,
          percent: 0.728,
          center: Text(
            '72.8%\n done',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: kButtonColor,
              fontSize: 32.0,
            ),
          ),
          footer: Text(
            'English',
            style: TextStyle(
              color: kButtonColor,
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}

class MilestonesIndicator extends StatefulWidget {
  final Color lineColor;
  final String name;
  final double percentage;
  const MilestonesIndicator(
      {Key? key,
      required this.name,
      required this.percentage,
      required this.lineColor})
      : super(key: key);

  @override
  _MilestonesIndicatorState createState() => _MilestonesIndicatorState();
}

class _MilestonesIndicatorState extends State<MilestonesIndicator> {
  bool isFocus = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MouseRegion(
        onEnter: (event) => setState(() => isFocus = true),
        onExit: (event) => setState(() => isFocus = false),
        child: AnimatedContainer(
          height: isFocus ? 28.0 : 20.0,
          duration: Duration(milliseconds: 300),
          child: LinearPercentIndicator(
            linearGradient: LinearGradient(
                colors: [widget.lineColor, widget.lineColor.withOpacity(0.6)]),
            widgetIndicator: Icon(
              Icons.flag,
              color: widget.lineColor,
              size: isFocus ? 45.0 : 25.0,
            ),
            percent: widget.percentage,
            lineHeight: isFocus ? 20.0 : 16.0,
            leading: Text(widget.name + ': ',
                style: kLabelTextStyle.copyWith(color: kButtonColor)),
            backgroundColor: kPrimaryColor.withOpacity(0.5),
            animationDuration: 3000,
            animation: true,
            center: Text(
              '${widget.percentage * 100}%',
              style: kLabelTextStyle.copyWith(
                  fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
