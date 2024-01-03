import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/ui/dashboard/recent_chat/recent_chat_model.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentChatWidget extends StatelessWidget {
  final RecentChatModel recentChatModel;
  const RecentChatWidget({super.key, required this.recentChatModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // navigation to chat screen
        AutoRouter.of(context).push(const ChatRoute());
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0).r,
        child: ListTile(
          leading: ClipOval(
            child: Image.asset(
              recentChatModel.personImage,
              width: 64.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Walmart',
                  style: introTitleText,
                ),
                Text(
                  '5 min',
                  style: mileText,
                ),
              ],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0).r,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Next Time we will provide best service with same product',
                    style: mileText,
                  ),
                ),
                recentChatModel.counter
                    ? Container(
                        height: 24.r,
                        width: 24.r,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColor.introTitleColorBlack,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '1',
                          style: introNextGoButtonText,
                        ),
                      )
                    : const Text(""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
