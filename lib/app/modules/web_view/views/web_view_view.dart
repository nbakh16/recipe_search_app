import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/modules/web_view/controllers/web_view_controller.dart';

class WebViewView extends StatelessWidget {
  const WebViewView({super.key});

  @override
  Widget build(BuildContext context) {
    final webViewController = Get.find<WebViewController>();
    late InAppWebViewController inAppWebViewController;

    final String url = Get.arguments;
    webViewController.setWebUrl(url);

    return WillPopScope(
      onWillPop: () async {
        bool canGoBack = await inAppWebViewController.canGoBack();

        if(canGoBack) {
          inAppWebViewController.goBack();
          return false;
        }

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                    // url: Uri.parse('https://www.seriouseats.com/chicken-vesuvio-recipe')
                    url: Uri.parse(webViewController.webUrl.value)
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  inAppWebViewController = controller;
                },
                onProgressChanged: (InAppWebViewController controller, int progress) {
                    webViewController.progress.value = progress / 100;
                },
              ),
              Obx(()=>
                Visibility(
                  visible: webViewController.progress.value < 1,
                  replacement: const SizedBox(),
                  child: LinearProgressIndicator(
                    minHeight: 10.0,
                    value: webViewController.progress.value,
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
