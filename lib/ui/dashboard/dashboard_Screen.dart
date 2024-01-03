import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as badges;
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/dashboard/business_names.dart';
import 'package:chat_ui_demo/ui/dashboard/my_order_screen/my_order_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/my_profile/profile_screen.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/string_constatnt.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndesx = 0;
  late List<Widget> screensList;
  late ValueNotifier<int> bottomNavigationNotifier;

  @override
  void initState() {
    bottomNavigationNotifier = ValueNotifier(0);
    screensList = [
      const StoreNamesScreen(),
      const MyOrderScreen(
          /* isBackPressed: () {
          setState(() {
            selectedIndesx = 0;
          });
        },*/
          ),
      const ProfileScreen(
          /*isBackPressed: () {
          setState(() {
            selectedIndesx = 0;
          });
        },*/
          ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    bottomNavigationNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: bottomNavigationNotifier,
        builder: (context, value, child) {
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.commonStore,
                  color: selectedIndesx == 0
                      ? AppColor.greenColor
                      : AppColor.unSelectedNavigation,
                  height: 21.r,
                  width: 21.r,
                ),
                label: StringConstant.store,
              ),
              BottomNavigationBarItem(
                  icon: badges.Badge(
                    badgeContent: Text(
                      StringConstant.badge,
                      style: rating,
                    ),
                    position: badges.BadgePosition.topEnd(),
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: AppColor.greenColor,
                    ),
                    child: Image.asset(
                      color: selectedIndesx == 1
                          ? AppColor.greenColor
                          : AppColor.unSelectedNavigation,
                      Assets.commonMyOrders,
                      height: 21.r,
                      width: 21.r,
                    ),
                  ),
                  label: StringConstant.store),
              BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.commonProfile,
                  color: selectedIndesx == 2
                      ? AppColor.greenColor
                      : AppColor.unSelectedNavigation,
                  height: 21.r,
                  width: 21.r,
                ),
                label: StringConstant.profile,
              ),
            ],
            currentIndex: selectedIndesx,
            backgroundColor: AppColor.deliveryBG.withOpacity(0.85),
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.greenColor,
            unselectedItemColor: AppColor.unSelectedNavigation,
            onTap: (int index) {
              selectedIndesx = index;
              bottomNavigationNotifier.value = selectedIndesx;
            },
          );
        },
      ),
      extendBody: true,
      body: ValueListenableBuilder(
        valueListenable: bottomNavigationNotifier,
        builder: (BuildContext context, value, Widget? child) {
          return screensList.elementAt(selectedIndesx);
        },
      ),
    );
  }
}
