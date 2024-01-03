import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LineChartScreen extends StatefulWidget {
  const LineChartScreen({Key? key}) : super(key: key);

  @override
  State<LineChartScreen> createState() => _LineChartScreenState();
}

class _LineChartScreenState extends State<LineChartScreen> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color(0xfff0f0f0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            children: <Widget>[
              ChartContainer(
                title: 'Line Chart',
                color: const Color.fromRGBO(45, 108, 223, 1),
                chart: LineChartContent(),
              ),
            ],
          ),
        ),
      ),
    );
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

  /*void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.width * 0.95 * 0.65,
          padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(top: 10),
                child: chart,
              ))
            ],
          ),
        ),
        15.h.verticalSpace,
        SizedBox(
          width: 250,
          height: 250,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: const Offset(0, 3), // Offset in x and y directions
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Hello',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class LineChartContent extends StatelessWidget {
  LineChartContent({super.key});

  List<LineChartBarData> lineChartBarData = [
    LineChartBarData(
      color: const Color(0xfff3f169),
      isCurved: true,
      spots: [
        const FlSpot(1, 8),
        const FlSpot(2, 12.4),
        const FlSpot(3, 10.8),
        const FlSpot(4, 9),
        const FlSpot(5, 8),
        const FlSpot(6, 8.6),
        const FlSpot(7, 10),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 1,
        minY: 0,
        maxX: 7,
        maxY: 16,
        lineBarsData: lineChartBarData,
      ),
    );
  }
}
