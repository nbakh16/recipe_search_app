import 'package:get/get.dart';

class WebViewController extends GetxController {
  final RxString webUrl = ''.obs;
  RxDouble progress = 0.0.obs;

  void setWebUrl(String url) => webUrl.value = url;


  @override
  void onClose() {}
}
