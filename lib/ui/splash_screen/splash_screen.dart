import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () {
        AutoRouter.of(context).push(const IntroRouteRoute());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.introNextColorWhite,
      body: Center(
        child: Image.asset(
          Assets.commonSplash,
          height: 118.r,
          width: 118.r,
        ),
      ),
    );
  }
}

// data => model , remote, repository ,
