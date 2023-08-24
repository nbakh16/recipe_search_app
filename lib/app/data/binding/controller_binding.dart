import 'package:get/get.dart';
import '../../modules/details/controllers/details_controller.dart';
import '../../modules/home/controllers/home_controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(DetailsController());
  }
}