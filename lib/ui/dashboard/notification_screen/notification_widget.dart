import 'package:chat_ui_demo/ui/dashboard/notification_screen/notification_model.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationWidget({Key? key, required this.notificationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        notificationModel.notificationMessage,
        style: orderTime.copyWith(
          color: AppColor.orderId,
        ),
      ),
      leading: Container(
        height: 35.r,
        width: 35.r,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.greenColor,
        ),
        child: const Icon(
          Icons.notifications,
          color: AppColor.introNextColorWhite,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            notificationModel.notificationId,
            style: timeText.copyWith(
              color: AppColor.checkBoxColor,
            ),
          ),
          Text(
            notificationModel.notificationTime,
            style: timeText.copyWith(
              color: AppColor.checkBoxColor,
            ),
          ),
        ],
      ),
    );
  }
}
