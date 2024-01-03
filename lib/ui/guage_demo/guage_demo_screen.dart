import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

@RoutePage()
class GuageDemoScreen extends StatefulWidget {
  const GuageDemoScreen({Key? key}) : super(key: key);

  @override
  State<GuageDemoScreen> createState() => _GuageDemoScreenState();
}

class _GuageDemoScreenState extends State<GuageDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainBody(),
    );
  }

  Widget mainBody() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20.0).r,
        child: KdGaugeView(
          minSpeed: 0,
          maxSpeed: 100,
          speed: 100,
          animate: true,
          duration: const Duration(
            seconds: 5,
          ),
          alertSpeedArray: const [
            60,
            90,
          ],
          alertColorArray: const [
            Colors.orangeAccent,
            Colors.red,
          ],
          unitOfMeasurement: "Mbps/Gbps",
          gaugeWidth: 10,
          fractionDigits: 0,
        ),
      ),
    );
  }
}
