import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class MyComponents {
  static Future openUrl({required String url}) {
    var uri = Uri.parse(url);
    return _launchUrl(uri);
  }

  static Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }

    // static Future _myUrlLauncher(Uri uri) async {
    //   if (await canLaunchUrl(uri)) {
    //     await launchUrl(uri);
    //   } else {
    //     log('URL is not valid!');
    //   }
    // }
  }
}
