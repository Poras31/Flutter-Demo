import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/generated/assets.dart';
import 'package:chat_ui_demo/ui/intro_screen/IntroScreenModel.dart';
import 'package:chat_ui_demo/ui/intro_screen/custom_app_button.dart';
import 'package:chat_ui_demo/values/color.dart';
import 'package:chat_ui_demo/values/dimens.dart';
import 'package:chat_ui_demo/values/string_constatnt.dart';
import 'package:chat_ui_demo/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'intro_page_screen.dart';

@RoutePage()
class IntroScreenPage extends StatefulWidget {
  const IntroScreenPage({Key? key}) : super(key: key);

  @override
  State<IntroScreenPage> createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  int currentIndex = 0;
  late PageController pageViewController;
  ValueNotifier pageViewNotifier = ValueNotifier(0);
  // final ValueNotifier<int> pageViewNotifier = ValueNotifier(0);
  List<IntroScreenModel> introPageScreenModel = [
    IntroScreenModel(
      pageImage: Assets.commonIntroFirst,
      pageTitle: StringConstant.introPageTitleFirst,
      pageSubTitle: StringConstant.introPageSubTitle,
    ),
    IntroScreenModel(
      pageImage: Assets.commonIntroSecond,
      pageTitle: StringConstant.introPageTitleSecond,
      pageSubTitle: StringConstant.introPageSubTitle,
    ),
    IntroScreenModel(
      pageImage: Assets.commonIntroThird,
      pageTitle: StringConstant.introPageTitleThird,
      pageSubTitle: StringConstant.introPageSubTitle,
    ),
  ];

  @override
  void initState() {
    pageViewNotifier = ValueNotifier(true);
    pageViewController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageViewNotifier.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.introNextColorWhite,
        body: mainBody(),
      ),
    );
  }

  Widget mainBody() {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: pageViewNotifier,
          builder: (BuildContext context, value, Widget? child) {
            return Padding(
              padding: const EdgeInsets.only(
                top: paddingTopIntro,
                right: paddingRightIntro,
              ).r,
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(const LoginRoute());
                  },
                  child: currentIndex == introPageScreenModel.length - 1
                      ? const Text("")
                      : Text(
                          StringConstant.skipButton,
                          style: introSkipText,
                        ),
                ),
              ),
            );
          },
        ),
        95.verticalSpace,
        mainIntroPage(),
        bottomDotsSlider(),
        20.verticalSpace,
      ],
    );
  }

  ValueListenableBuilder<dynamic> bottomDotsSlider() {
    return ValueListenableBuilder(
      valueListenable: pageViewNotifier,
      builder: (BuildContext context, value, Widget? child) {
        return Padding(
          padding: const EdgeInsets.only(
            left: paddingIntroLR,
            right: paddingIntroLR,
          ).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60.h,
                width: 130.w,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: introPageScreenModel.length,
                  itemBuilder: (context, index) {
                    return buildDot(index, context);
                  },
                ),
              ),
              CustomAppButton(
                buttonStyle: ElevatedButton.styleFrom(
                  fixedSize: Size(60.w, 30.h),
                  primary: AppColor.greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius).r,
                  ),
                ),
                callback: () {
                  if (currentIndex == introPageScreenModel.length - 1) {
                    AutoRouter.of(context).push(const LoginRoute());
                  }
                  pageViewController.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
                label: currentIndex == introPageScreenModel.length - 1
                    ? Text(
                        StringConstant.goButton,
                        style: introNextGoButtonText,
                      )
                    : Text(
                        StringConstant.nextButton,
                        style: introNextGoButtonText,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget mainIntroPage() {
    return Expanded(
      child: ValueListenableBuilder(
        builder: (BuildContext context, value, Widget? child) {
          return PageView.builder(
            controller: pageViewController,
            itemCount: introPageScreenModel.length,
            onPageChanged: (int index) {
              currentIndex = index;
              pageViewNotifier.value = currentIndex;
            },
            itemBuilder: (BuildContext context, int index) {
              final IntroScreenModel item = introPageScreenModel[index];
              return Column(
                children: [
                  IntroPageScreenWidget(
                    introScreenModel: item,
                  ),
                ],
              );
            },
          );
        },
        valueListenable: pageViewNotifier,
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 30,
      ).r,
      child: Container(
        height: currentIndex == index ? 8.h : 4.h,
        width: currentIndex == index ? 32.w : 8.w,
        decoration: BoxDecoration(
          borderRadius:
              currentIndex == index ? BorderRadius.circular(10).r : null,
          shape: currentIndex == index ? BoxShape.rectangle : BoxShape.circle,
          color:
              currentIndex == index ? AppColor.greenColor : AppColor.greyColor,
        ),
      ),
    );
  }
}
