import 'package:recipe_app/app/modules/details/controllers/details_controller.dart';
import 'package:recipe_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/modules/web_view/controllers/web_view_controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(DetailsController());
    Get.put(WebViewController());
  }
}