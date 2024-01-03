import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/bottommenu.dart';
import 'package:chat_ui_demo/main.dart';
import 'package:chat_ui_demo/mobx/state_management_screen.dart';
import 'package:chat_ui_demo/mobx/state_management_screen_two.dart';
import 'package:chat_ui_demo/ui/add_more_details/add_more_details_screen.dart';
import 'package:chat_ui_demo/ui/bar_chart/bar_chart_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/add_address/add_address_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/api_calling/api_calling_dio.dart';
import 'package:chat_ui_demo/ui/dashboard/api_calling/api_calling_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/business_names.dart';
import 'package:chat_ui_demo/ui/dashboard/category_screen/category_food_milk_model.dart';
import 'package:chat_ui_demo/ui/dashboard/category_screen/category_foods_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/change_payment/change_payment_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/chat_screen/chat_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/contact_us_screen/contact_us_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/dashboard_Screen.dart';
import 'package:chat_ui_demo/ui/dashboard/details/store_details_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/edit_address/edit_address_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/edit_profile/edit_profile_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/manage_address/manage_address_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/more_product_screen/more_product_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/my_order_details/my_order_details.dart';
import 'package:chat_ui_demo/ui/dashboard/my_order_screen/my_order_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/my_profile/profile_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/notification_screen/notification_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/place_order/place_order_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/product_details_screen/product_details_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/rate_app/rate_app_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/recent_chat/recent_chat_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/set_location/set_location_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/share_app/share_app_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/store_names_model.dart';
import 'package:chat_ui_demo/ui/dashboard/success_screen/success_screen.dart';
import 'package:chat_ui_demo/ui/dashboard/web_view_screen/web_view_screen.dart';
import 'package:chat_ui_demo/ui/demo_rally_app/rally_sport_selection_screen.dart';
import 'package:chat_ui_demo/ui/guage_demo/guage_demo_screen.dart';
import 'package:chat_ui_demo/ui/hive_datase/hive_home_screen.dart';
import 'package:chat_ui_demo/ui/image_picker/image_picker_home_screen.dart';
import 'package:chat_ui_demo/ui/intro_screen/intro_screen.dart';
import 'package:chat_ui_demo/ui/line_chart/line_chart_screen.dart';
import 'package:chat_ui_demo/ui/login_ui/login_screen.dart';
import 'package:chat_ui_demo/ui/pdf_picker/pdf_picker_home_screen.dart';
import 'package:chat_ui_demo/ui/permission_screen/permission_demo_screen.dart';
import 'package:chat_ui_demo/ui/splash_screen/splash_screen.dart';
import 'package:chat_ui_demo/ui/stream_builder/stream_builder_demo.dart';
import 'package:chat_ui_demo/ui/verification_screen/verification_screen.dart';
import 'package:chat_ui_demo/ui/view_cart_screen/view_cart_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends _$AppRouter {
  /*@override
  RouteType get defaultRouteType => const RouteType.adaptive();*/

  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          page: MyHomeRoute.page,
        ),
        AdaptiveRoute(
          page: BottomMenuRoute.page,
        ),
        AdaptiveRoute(
          page: LoginRoute.page,
        ),
        AdaptiveRoute(
          page: VerificationRoute.page,
        ),
        AdaptiveRoute(
          page: AddMoreDetailsRoute.page,
        ),
        AdaptiveRoute(
          page: DashBoardRoute.page,
        ),
        AdaptiveRoute(
          page: StoreNamesRoute.page,
        ),
        AdaptiveRoute(
          page: CategoryFoodsRoute.page,
        ),
        AdaptiveRoute(
          page: StoreDetailsRoute.page,
        ),
        AdaptiveRoute(
          page: MoreProductRoute.page,
        ),
        AdaptiveRoute(
          page: ProductDetailsRoute.page,
        ),
        AdaptiveRoute(
          page: IntroRouteRoute.page,
        ),
        AdaptiveRoute(
          page: ViewCartRoute.page,
        ),
        AdaptiveRoute(
          page: PlaceOrderRoute.page,
        ),
        AdaptiveRoute(
          page: ManageAddressRoute.page,
        ),
        AdaptiveRoute(
          page: ImagePickerHomeRoute.page,
          //initial: true,
        ),
        AdaptiveRoute(
          page: ApiCallingRoute.page,
          //initial: true,
        ),
        AdaptiveRoute(
          page: ApiCallingDioRoute.page,
          //initial: true,
        ),
        AdaptiveRoute(
          page: StreamBuilderDemoRoute.page,
          //initial: true,
        ),
        AdaptiveRoute(
          page: PermissionDemoRoute.page,
          //initial: true,
        ),
        AdaptiveRoute(
          page: GuageDemoRoute.page,
          //initial: true,
        ),
        AdaptiveRoute(
          page: RallySportSelectionRoute.page,
          initial: true,
        ),
        AdaptiveRoute(
          page: LineChartRoute.page,
          // initial: true,
        ),
        AdaptiveRoute(
          page: BarChartRoute.page,
          // initial: true,
        ),
        AdaptiveRoute(
          page: StatemanagementRoute.page,
          // initial: true,
        ),
        AdaptiveRoute(
          page: StatemanagementRouteTwo.page,
          //initial: true,
        ),
        AdaptiveRoute(
          page: PDFPickerHomeRoute.page,
          //initial: true,
        ),
        AdaptiveRoute(
          page: EditAddressRoute.page,
        ),
        AdaptiveRoute(
          page: AddAddressRoute.page,
        ),
        AdaptiveRoute(
          page: SetLocationRoute.page,
        ),
        AdaptiveRoute(
          page: HiveHomeRoute.page,
          // initial: true,
        ),
        AdaptiveRoute(
          page: ChangePaymentRoute.page,
        ),
        AdaptiveRoute(
          page: SuccessRoute.page,
        ),
        AdaptiveRoute(
          page: WebViewRoute.page,
        ),
        AdaptiveRoute(
          page: RecentChatRoute.page,
        ),
        AdaptiveRoute(
          page: MyOrderDetailsRoute.page,
        ),
        AdaptiveRoute(
          page: ContactUsRoute.page,
        ),
        AdaptiveRoute(
          page: ProfileRoute.page,
        ),
        AdaptiveRoute(
          page: EditProfileRoute.page,
        ),
        AdaptiveRoute(
          page: MyOrderRoute.page,
        ),
        AdaptiveRoute(
          page: RateAppRoute.page,
        ),
        AdaptiveRoute(
          page: ShareAppRoute.page,
        ),
        AdaptiveRoute(
          page: ChatRoute.page,
        ),
        AdaptiveRoute(
          page: NotificationRoute.page,
        ),
        AdaptiveRoute(
          page: SplashRoute.page,
        ),
      ];
}
