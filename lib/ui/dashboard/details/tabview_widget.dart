import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabView extends StatelessWidget {
  const TabView({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.introNextColorWhite,
      height: 60.h,
      padding: const EdgeInsets.only(bottom: 12).r,
      width: MediaQuery.of(context).size.width,
      child: TabBar(
        isScrollable: false,
        controller: _tabController,
        labelPadding: EdgeInsets.zero,
        labelStyle: const TextStyle(
          color: AppColor.transparent,
        ),
        labelColor: AppColor.greenColor,
        indicatorColor: AppColor.transparent,
        unselectedLabelColor: AppColor.unSelectedLabel,
        tabs: <Widget>[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(right: 5).r,
            color: AppColor.deliveryBG,
            child: Tab(
              child: Text(
                'About',
                style: tabView,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: AppColor.deliveryBG,
            child: Tab(
              child: Text(
                'Review',
                style: tabView,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
