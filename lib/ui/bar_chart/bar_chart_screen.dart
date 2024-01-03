import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BarChartScreen extends StatefulWidget {
  const BarChartScreen({Key? key}) : super(key: key);

  @override
  State<BarChartScreen> createState() => _BarChartScreenState();
}

class _BarChartScreenState extends State<BarChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar chart'),
      ),
      body: mainBody(),
    );
  }

  Widget mainBody() {
    return Center(
      child: Container(
        color: const Color(0xfff0f0f0),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
          children: <Widget>[
            ChartContainer(
                title: 'Bar Chart',
                color: const Color(0xfffc5185),
                chart: BarChartContent()),
          ],
        ),
      ),
    );
  }
}

class BarChartContent extends StatelessWidget {
  List<BarChartGroupData> barChartGroupData = [
    BarChartGroupData(x: 1, barRods: [
      BarChartRodData(fromY: 10, color: const Color(0xff43dde6), toY: 8),
    ]),
    BarChartGroupData(x: 2, barRods: [
      BarChartRodData(fromY: 8.5, color: const Color(0xff43dde6), toY: 10),
    ]),
    BarChartGroupData(x: 3, barRods: [
      BarChartRodData(fromY: 12.6, color: const Color(0xff43dde6), toY: 5),
    ]),
    BarChartGroupData(x: 4, barRods: [
      BarChartRodData(fromY: 11.4, color: const Color(0xff43dde6), toY: 5),
    ]),
    BarChartGroupData(x: 5, barRods: [
      BarChartRodData(fromY: 7.5, color: const Color(0xff43dde6), toY: 5),
    ]),
    BarChartGroupData(x: 6, barRods: [
      BarChartRodData(fromY: 14, color: const Color(0xff43dde6), toY: 5),
    ]),
    BarChartGroupData(x: 7, barRods: [
      BarChartRodData(fromY: 12.2, color: const Color(0xff43dde6), toY: 5),
    ]),
  ];

  BarChartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
      maxY: 16,
      barGroups: barChartGroupData,
    ));
  }
}

class ChartContainer extends StatelessWidget {
  final Color color;
  final String title;
  final Widget chart;

  const ChartContainer({
    Key? key,
    required this.title,
    required this.color,
    required this.chart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 0.95 * 0.65,
        padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(top: 10),
              child: chart,
            ))
          ],
        ),
      ),
    );
  }
}
