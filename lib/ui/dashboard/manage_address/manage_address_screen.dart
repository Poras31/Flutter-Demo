import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ManageAddressScreen extends StatefulWidget {
  const ManageAddressScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
  late int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgOrderDetails,
      appBar: buildBaseAppBar(),
      body: mainBody(),
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Text(
        "Manage Address",
        style: verificationTitle,
      ),
      elevations: 4,
      shadowColor: AppColor.baseAppBar,
      leadingWidget: InkWell(
        onTap: () {
          // navigation to go back
          AutoRouter.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_sharp,
          color: AppColor.introTitleColorBlack,
        ),
      ),
    );
  }

  Widget mainBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0).r,
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                RadioListTile(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) => setState(() => _value = value!),
                  activeColor: AppColor.greenColor,
                  selected: true,
                  title: Text(
                    '799 Lost Creek Road,Seattle , Fort Washington, Us, 19034',
                    style: manageAddress,
                  ),
                ),
                15.h.verticalSpace,
                const Divider(
                  color: AppColor.verticalDivider,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 40.0,
                  ).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          //delete address code is here
                        },
                        icon: Image.asset(
                          Assets.commonDelete,
                          height: 16.r,
                          width: 16.r,
                        ),
                        label: Text(
                          'Delete',
                          style: deleteEdit,
                        ),
                      ),
                      SizedBox(
                        height: 48.h,
                        child: const VerticalDivider(
                          thickness: 1,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          //navigation to edit address route,
                          AutoRouter.of(context).push(const EditAddressRoute());
                        },
                        icon: Image.asset(
                          Assets.commonEdit,
                          height: 16.r,
                          width: 16.r,
                        ),
                        label: Text(
                          'Change',
                          style: deleteEdit,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                RadioListTile(
                  toggleable: true,
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) => setState(() => _value = value!),
                  activeColor: AppColor.greenColor,
                  selected: true,
                  title: Text(
                    '799 Lost Creek Road,Seattle , Fort Washington, Us, 19034',
                    style: manageAddress,
                  ),
                ),
                15.h.verticalSpace,
                const Divider(
                  color: AppColor.verticalDivider,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 40.0,
                  ).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          //delete address code is here
                        },
                        icon: Image.asset(
                          Assets.commonDelete,
                          height: 16.r,
                          width: 16.r,
                        ),
                        label: Text(
                          'Delete',
                          style: deleteEdit,
                        ),
                      ),
                      SizedBox(
                        height: 48.h,
                        child: const VerticalDivider(
                          thickness: 1,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          //navigation to edit address route,
                          AutoRouter.of(context).push(const EditAddressRoute());
                        },
                        icon: Image.asset(
                          Assets.commonEdit,
                          height: 16.r,
                          width: 16.r,
                        ),
                        label: Text(
                          'Change',
                          style: deleteEdit,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          35.h.verticalSpace,
          TextButton.icon(
            onPressed: () {
              //navigation to add new address screen
              AutoRouter.of(context).push(const AddAddressRoute());
            },
            icon: Image.asset(
              Assets.profileAdd,
              height: 22.r,
              width: 22.r,
            ),
            label: Text(
              'Add New',
              style: verificationTitle.copyWith(
                fontSize: 16.sm,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
