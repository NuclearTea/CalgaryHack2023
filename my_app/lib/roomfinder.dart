import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RoomFinder extends StatefulWidget {
  const RoomFinder({super.key});

  @override
  State<RoomFinder> createState() => _RoomFinderState();
}

class _RoomFinderState extends State<RoomFinder> {
  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  WebViewController con = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(
        'https://ucalgary-gs.maps.arcgis.com/apps/webappviewer/index.html?id=2e1817b41cb64815a50f617593aabf4e'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(),
        body: WebViewWidget(controller: con),
      ),
    );
  }
}
