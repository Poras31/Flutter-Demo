import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/ui/dashboard/notification_screen/notification_model.dart';
import 'package:chat_ui_demo/ui/dashboard/notification_screen/notification_widget.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> notificationModel = [
    NotificationModel(
      notificationMessage: 'Your order has been successfully placed!',
      notificationId: 'Order Id : ABC1234',
      notificationTime: '3:00 pm',
    ),
    NotificationModel(
      notificationMessage: 'Admin was Deleted unnecessary product',
      notificationId: '',
      notificationTime: '12:00 pm',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBaseAppBar(),
      body: mainBody(),
    );
  }

  BaseAppBar buildBaseAppBar() {
    return BaseAppBar(
      title: Text(
        'Notifications',
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
      child: ListView.builder(
        itemCount: notificationModel.length,
        itemBuilder: (context, index) {
          final NotificationModel model = notificationModel[index];
          return NotificationWidget(
            notificationModel: model,
          );
        },
      ),
    );
  }
}
