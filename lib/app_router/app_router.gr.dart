// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BottomMenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomMenuPage(),
      );
    },
    MyHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyHomePage(),
      );
    },
    StatemanagementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatemanagementScreen(),
      );
    },
    StatemanagementRouteTwo.name: (routeData) {
      final args = routeData.argsAs<StatemanagementRouteTwoArgs>(
          orElse: () => const StatemanagementRouteTwoArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StatemanagementScreenTwo(key: args.key),
      );
    },
    AddMoreDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddMoreDetailsScreen(),
      );
    },
    BarChartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BarChartScreen(),
      );
    },
    AddAddressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddAddressScreen(),
      );
    },
    ApiCallingDioRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ApiCallingDioScreen(),
      );
    },
    ApiCallingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ApiCallingScreen(),
      );
    },
    StoreNamesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoreNamesScreen(),
      );
    },
    CategoryFoodsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoryFoodsScreen(),
      );
    },
    ChangePaymentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangePaymentScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatScreen(),
      );
    },
    ContactUsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactUsScreen(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashBoardScreen(),
      );
    },
    StoreDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<StoreDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StoreDetailsScreen(
          key: args.key,
          storeNamesModel: args.storeNamesModel,
        ),
      );
    },
    EditAddressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditAddressScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfileScreen(),
      );
    },
    ManageAddressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ManageAddressScreen(),
      );
    },
    MoreProductRoute.name: (routeData) {
      final args = routeData.argsAs<MoreProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MoreProductScreen(
          key: args.key,
          categoryFoodMilkModel: args.categoryFoodMilkModel,
        ),
      );
    },
    MyOrderDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyOrderDetailsScreen(),
      );
    },
    MyOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyOrderScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationScreen(),
      );
    },
    PlaceOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaceOrderScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailsScreen(
          key: args.key,
          categoryFoodMilkModel: args.categoryFoodMilkModel,
        ),
      );
    },
    RateAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RateAppScreen(),
      );
    },
    RecentChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RecentChatScreen(),
      );
    },
    SetLocationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetLocationScreen(),
      );
    },
    ShareAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShareAppScreen(),
      );
    },
    SuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SuccessScreen(),
      );
    },
    WebViewRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WebViewScreen(
          key: args.key,
          title: args.title,
          staticUrl: args.staticUrl,
        ),
      );
    },
    RallySportSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RallySportSelectionScreen(),
      );
    },
    GuageDemoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GuageDemoScreen(),
      );
    },
    HiveHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HiveHomeScreen(),
      );
    },
    ImagePickerHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ImagePickerHomeScreen(),
      );
    },
    IntroRouteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IntroScreenPage(),
      );
    },
    LineChartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LineChartScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    PDFPickerHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PDFPickerHomeScreen(),
      );
    },
    PermissionDemoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PermissionDemoScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    StreamBuilderDemoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StreamBuilderDemoScreen(),
      );
    },
    VerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerificationScreen(),
      );
    },
    ViewCartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ViewCartScreen(),
      );
    },
  };
}

/// generated route for
/// [BottomMenuPage]
class BottomMenuRoute extends PageRouteInfo<void> {
  const BottomMenuRoute({List<PageRouteInfo>? children})
      : super(
          BottomMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomMenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyHomePage]
class MyHomeRoute extends PageRouteInfo<void> {
  const MyHomeRoute({List<PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StatemanagementScreen]
class StatemanagementRoute extends PageRouteInfo<void> {
  const StatemanagementRoute({List<PageRouteInfo>? children})
      : super(
          StatemanagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatemanagementRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StatemanagementScreenTwo]
class StatemanagementRouteTwo
    extends PageRouteInfo<StatemanagementRouteTwoArgs> {
  StatemanagementRouteTwo({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          StatemanagementRouteTwo.name,
          args: StatemanagementRouteTwoArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'StatemanagementRouteTwo';

  static const PageInfo<StatemanagementRouteTwoArgs> page =
      PageInfo<StatemanagementRouteTwoArgs>(name);
}

class StatemanagementRouteTwoArgs {
  const StatemanagementRouteTwoArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'StatemanagementRouteTwoArgs{key: $key}';
  }
}

/// generated route for
/// [AddMoreDetailsScreen]
class AddMoreDetailsRoute extends PageRouteInfo<void> {
  const AddMoreDetailsRoute({List<PageRouteInfo>? children})
      : super(
          AddMoreDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMoreDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BarChartScreen]
class BarChartRoute extends PageRouteInfo<void> {
  const BarChartRoute({List<PageRouteInfo>? children})
      : super(
          BarChartRoute.name,
          initialChildren: children,
        );

  static const String name = 'BarChartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddAddressScreen]
class AddAddressRoute extends PageRouteInfo<void> {
  const AddAddressRoute({List<PageRouteInfo>? children})
      : super(
          AddAddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddAddressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ApiCallingDioScreen]
class ApiCallingDioRoute extends PageRouteInfo<void> {
  const ApiCallingDioRoute({List<PageRouteInfo>? children})
      : super(
          ApiCallingDioRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApiCallingDioRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ApiCallingScreen]
class ApiCallingRoute extends PageRouteInfo<void> {
  const ApiCallingRoute({List<PageRouteInfo>? children})
      : super(
          ApiCallingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApiCallingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StoreNamesScreen]
class StoreNamesRoute extends PageRouteInfo<void> {
  const StoreNamesRoute({List<PageRouteInfo>? children})
      : super(
          StoreNamesRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoreNamesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoryFoodsScreen]
class CategoryFoodsRoute extends PageRouteInfo<void> {
  const CategoryFoodsRoute({List<PageRouteInfo>? children})
      : super(
          CategoryFoodsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryFoodsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePaymentScreen]
class ChangePaymentRoute extends PageRouteInfo<void> {
  const ChangePaymentRoute({List<PageRouteInfo>? children})
      : super(
          ChangePaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePaymentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactUsScreen]
class ContactUsRoute extends PageRouteInfo<void> {
  const ContactUsRoute({List<PageRouteInfo>? children})
      : super(
          ContactUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactUsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashBoardScreen]
class DashBoardRoute extends PageRouteInfo<void> {
  const DashBoardRoute({List<PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StoreDetailsScreen]
class StoreDetailsRoute extends PageRouteInfo<StoreDetailsRouteArgs> {
  StoreDetailsRoute({
    Key? key,
    required StoreNamesModel storeNamesModel,
    List<PageRouteInfo>? children,
  }) : super(
          StoreDetailsRoute.name,
          args: StoreDetailsRouteArgs(
            key: key,
            storeNamesModel: storeNamesModel,
          ),
          initialChildren: children,
        );

  static const String name = 'StoreDetailsRoute';

  static const PageInfo<StoreDetailsRouteArgs> page =
      PageInfo<StoreDetailsRouteArgs>(name);
}

class StoreDetailsRouteArgs {
  const StoreDetailsRouteArgs({
    this.key,
    required this.storeNamesModel,
  });

  final Key? key;

  final StoreNamesModel storeNamesModel;

  @override
  String toString() {
    return 'StoreDetailsRouteArgs{key: $key, storeNamesModel: $storeNamesModel}';
  }
}

/// generated route for
/// [EditAddressScreen]
class EditAddressRoute extends PageRouteInfo<void> {
  const EditAddressRoute({List<PageRouteInfo>? children})
      : super(
          EditAddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditAddressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ManageAddressScreen]
class ManageAddressRoute extends PageRouteInfo<void> {
  const ManageAddressRoute({List<PageRouteInfo>? children})
      : super(
          ManageAddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageAddressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MoreProductScreen]
class MoreProductRoute extends PageRouteInfo<MoreProductRouteArgs> {
  MoreProductRoute({
    Key? key,
    required List<CategoryFoodMilkModel> categoryFoodMilkModel,
    List<PageRouteInfo>? children,
  }) : super(
          MoreProductRoute.name,
          args: MoreProductRouteArgs(
            key: key,
            categoryFoodMilkModel: categoryFoodMilkModel,
          ),
          initialChildren: children,
        );

  static const String name = 'MoreProductRoute';

  static const PageInfo<MoreProductRouteArgs> page =
      PageInfo<MoreProductRouteArgs>(name);
}

class MoreProductRouteArgs {
  const MoreProductRouteArgs({
    this.key,
    required this.categoryFoodMilkModel,
  });

  final Key? key;

  final List<CategoryFoodMilkModel> categoryFoodMilkModel;

  @override
  String toString() {
    return 'MoreProductRouteArgs{key: $key, categoryFoodMilkModel: $categoryFoodMilkModel}';
  }
}

/// generated route for
/// [MyOrderDetailsScreen]
class MyOrderDetailsRoute extends PageRouteInfo<void> {
  const MyOrderDetailsRoute({List<PageRouteInfo>? children})
      : super(
          MyOrderDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyOrderDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyOrderScreen]
class MyOrderRoute extends PageRouteInfo<void> {
  const MyOrderRoute({List<PageRouteInfo>? children})
      : super(
          MyOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlaceOrderScreen]
class PlaceOrderRoute extends PageRouteInfo<void> {
  const PlaceOrderRoute({List<PageRouteInfo>? children})
      : super(
          PlaceOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductDetailsScreen]
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    Key? key,
    required CategoryFoodMilkModel categoryFoodMilkModel,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            categoryFoodMilkModel: categoryFoodMilkModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const PageInfo<ProductDetailsRouteArgs> page =
      PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.categoryFoodMilkModel,
  });

  final Key? key;

  final CategoryFoodMilkModel categoryFoodMilkModel;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, categoryFoodMilkModel: $categoryFoodMilkModel}';
  }
}

/// generated route for
/// [RateAppScreen]
class RateAppRoute extends PageRouteInfo<void> {
  const RateAppRoute({List<PageRouteInfo>? children})
      : super(
          RateAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'RateAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecentChatScreen]
class RecentChatRoute extends PageRouteInfo<void> {
  const RecentChatRoute({List<PageRouteInfo>? children})
      : super(
          RecentChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecentChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SetLocationScreen]
class SetLocationRoute extends PageRouteInfo<void> {
  const SetLocationRoute({List<PageRouteInfo>? children})
      : super(
          SetLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetLocationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShareAppScreen]
class ShareAppRoute extends PageRouteInfo<void> {
  const ShareAppRoute({List<PageRouteInfo>? children})
      : super(
          ShareAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShareAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SuccessScreen]
class SuccessRoute extends PageRouteInfo<void> {
  const SuccessRoute({List<PageRouteInfo>? children})
      : super(
          SuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebViewScreen]
class WebViewRoute extends PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    Key? key,
    required String title,
    required String staticUrl,
    List<PageRouteInfo>? children,
  }) : super(
          WebViewRoute.name,
          args: WebViewRouteArgs(
            key: key,
            title: title,
            staticUrl: staticUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'WebViewRoute';

  static const PageInfo<WebViewRouteArgs> page =
      PageInfo<WebViewRouteArgs>(name);
}

class WebViewRouteArgs {
  const WebViewRouteArgs({
    this.key,
    required this.title,
    required this.staticUrl,
  });

  final Key? key;

  final String title;

  final String staticUrl;

  @override
  String toString() {
    return 'WebViewRouteArgs{key: $key, title: $title, staticUrl: $staticUrl}';
  }
}

/// generated route for
/// [RallySportSelectionScreen]
class RallySportSelectionRoute extends PageRouteInfo<void> {
  const RallySportSelectionRoute({List<PageRouteInfo>? children})
      : super(
          RallySportSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'RallySportSelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GuageDemoScreen]
class GuageDemoRoute extends PageRouteInfo<void> {
  const GuageDemoRoute({List<PageRouteInfo>? children})
      : super(
          GuageDemoRoute.name,
          initialChildren: children,
        );

  static const String name = 'GuageDemoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HiveHomeScreen]
class HiveHomeRoute extends PageRouteInfo<void> {
  const HiveHomeRoute({List<PageRouteInfo>? children})
      : super(
          HiveHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HiveHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ImagePickerHomeScreen]
class ImagePickerHomeRoute extends PageRouteInfo<void> {
  const ImagePickerHomeRoute({List<PageRouteInfo>? children})
      : super(
          ImagePickerHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImagePickerHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IntroScreenPage]
class IntroRouteRoute extends PageRouteInfo<void> {
  const IntroRouteRoute({List<PageRouteInfo>? children})
      : super(
          IntroRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRouteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LineChartScreen]
class LineChartRoute extends PageRouteInfo<void> {
  const LineChartRoute({List<PageRouteInfo>? children})
      : super(
          LineChartRoute.name,
          initialChildren: children,
        );

  static const String name = 'LineChartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PDFPickerHomeScreen]
class PDFPickerHomeRoute extends PageRouteInfo<void> {
  const PDFPickerHomeRoute({List<PageRouteInfo>? children})
      : super(
          PDFPickerHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PDFPickerHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PermissionDemoScreen]
class PermissionDemoRoute extends PageRouteInfo<void> {
  const PermissionDemoRoute({List<PageRouteInfo>? children})
      : super(
          PermissionDemoRoute.name,
          initialChildren: children,
        );

  static const String name = 'PermissionDemoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StreamBuilderDemoScreen]
class StreamBuilderDemoRoute extends PageRouteInfo<void> {
  const StreamBuilderDemoRoute({List<PageRouteInfo>? children})
      : super(
          StreamBuilderDemoRoute.name,
          initialChildren: children,
        );

  static const String name = 'StreamBuilderDemoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerificationScreen]
class VerificationRoute extends PageRouteInfo<void> {
  const VerificationRoute({List<PageRouteInfo>? children})
      : super(
          VerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ViewCartScreen]
class ViewCartRoute extends PageRouteInfo<void> {
  const ViewCartRoute({List<PageRouteInfo>? children})
      : super(
          ViewCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewCartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
