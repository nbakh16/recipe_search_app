import 'package:get/get.dart';

import 'package:recipe_app/app/modules/details/views/details_view.dart';
import 'package:recipe_app/app/modules/home/views/home_view.dart';
import 'package:recipe_app/app/modules/web_view/views/web_view_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => const DetailsView(),
    ),
    GetPage(
      name: _Paths.WEB_VIEW,
      page: () => const WebViewView(),
    ),
  ];
}
