import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/dashboard/my_profile/profile_screen_model.dart';
import 'package:chat_ui_demo/ui/dashboard/my_profile/profile_widget.dart';
import 'package:chat_ui_demo/ui/utils/base_app_bar.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  // final Function isBackPressed;
  const ProfileScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<ProfileScreenModel> profileModel = [
    ProfileScreenModel(
      profileImage: Assets.profileManageAddress,
      profileName: 'Manage Address',
    ),
    ProfileScreenModel(
      profileImage: Assets.profileRecentChat,
      profileName: 'Recent Chat',
    ),
    ProfileScreenModel(
      profileImage: Assets.profileNotification,
      profileName: 'Notification',
    ),
    ProfileScreenModel(
      profileImage: Assets.profileRate,
      profileName: 'Rate the App',
    ),
    ProfileScreenModel(
      profileImage: Assets.profileShare,
      profileName: 'Share App',
    ),
    ProfileScreenModel(
      profileImage: Assets.profileHelp,
      profileName: 'Help & FAQ',
    ),
    ProfileScreenModel(
      profileImage: Assets.profileAbout,
      profileName: 'About Us',
    ),
    ProfileScreenModel(
      profileImage: Assets.profileTermsCondition,
      profileName: 'Terms & Condition',
    ),
    ProfileScreenModel(
      profileImage: Assets.profilePrivacy,
      profileName: 'Privacy Policy',
    ),
    ProfileScreenModel(
      profileImage: Assets.profileContacts,
      profileName: 'Contact Us',
    ),
    ProfileScreenModel(
      profileImage: Assets.profileLogout,
      profileName: 'Logout',
    ),
  ];

  void onSelectedItem(int index) {
    switch (index) {
      case 0:
        AutoRouter.of(context).push(const ManageAddressRoute());
        break;

      case 1:
        //  navigation to recent chat screen
        //AutoRouter.of(context).push(const RecentChatRoute());
        break;

      case 2:
        //  navigation to notification  screen
        AutoRouter.of(context).push(const NotificationRoute());
        break;

      case 3:
        //  navigation to recent rate app screen
        AutoRouter.of(context).push(const RateAppRoute());
        break;

      case 4:
        //  navigation to recent share app screen
        AutoRouter.of(context).push(const ShareAppRoute());
        break;

      case 5:
        //  navigation to recent help and faq screen
        AutoRouter.of(context).push(WebViewRoute(
            title: 'Help & FAQ',
            staticUrl:
                "https://reporting.hyperlinkinfosystem.net.in/hlink_reporting/dashboard"));
        break;

      case 6:
        //  navigation to recent about us screen
        AutoRouter.of(context).push(WebViewRoute(
            title: 'About Us',
            staticUrl:
                "https://reporting.hyperlinkinfosystem.net.in/hlink_reporting/dashboard"));
        break;

      case 7:
        //  navigation to recent terms and condition screen
        AutoRouter.of(context).push(WebViewRoute(
            title: 'Terms and Condition',
            staticUrl:
                "https://reporting.hyperlinkinfosystem.net.in/hlink_reporting/dashboard"));
        break;

      case 8:
        //  navigation to recent privacy policy screen
        AutoRouter.of(context).push(WebViewRoute(
            title: 'Privacy Policy',
            staticUrl:
                "https://reporting.hyperlinkinfosystem.net.in/hlink_reporting/dashboard"));
        break;

      case 9:
        //  navigation to recent contact us screen
        AutoRouter.of(context).push(const ContactUsRoute());
        break;

      case 10:
        //  show dialog for logout
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Do you want to exit this application?',
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      //this button is for close dialog
                      AutoRouter.of(context).pop();
                    },
                    child: const Text('No'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //this button is for clear all data and navigation to login screen
                      AutoRouter.of(context).replaceAll([const LoginRoute()]);
                    },
                    child: const Text('Yes'),
                  ),
                ],
              );
            });
        break;
    }
  }

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
        'Walmart',
        style: verificationTitle,
      ),
      shadowColor: AppColor.baseAppBar,
      elevations: 4,
      leadingWidget: InkWell(
        onTap: () {
          //navigation to go back
          //AutoRouter.of(context).popUntilRoot();
          // widget.isBackPressed();
        },
        child: const Icon(
          Icons.arrow_back_ios_sharp,
          color: AppColor.introTitleColorBlack,
        ),
      ),
      action: [
        InkWell(
          onTap: () {
            //navigation to go edit profile screen
            AutoRouter.of(context).push(const EditProfileRoute());
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: 15.0,
            ).r,
            child: Image.asset(
              Assets.profileEditWalmart,
              height: 20.r,
              width: 20.r,
            ),
          ),
        )
      ],
    );
  }

  Widget mainBody() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 16,
        top: 16.0,
      ).r,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3.r / 2.6.r,
        ),
        itemBuilder: (context, index) {
          final ProfileScreenModel model = profileModel[index];
          return InkWell(
            onTap: () {
              // selection code
              onSelectedItem(index);
            },
            child: ProfileWidget(
              profileScreenModel: model,
            ),
          );
        },
        itemCount: profileModel.length,
      ),
    );
  }
}
