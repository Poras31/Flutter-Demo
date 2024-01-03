import 'package:chat_ui_demo/ui/dashboard/my_profile/profile_screen_model.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatelessWidget {
  final ProfileScreenModel profileScreenModel;
  const ProfileWidget({super.key, required this.profileScreenModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
        ).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              profileScreenModel.profileImage,
              height: 35.r,
              width: 40.r,
            ),
            25.h.verticalSpace,
            Text(
              profileScreenModel.profileName,
              style: totalAmount.copyWith(
                fontSize: 16.sm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
