import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class UrlLauncherHelper {
  UrlLauncherHelper._();
  static UrlLauncherHelper urlLauncherHelper = UrlLauncherHelper._();

  void launchUrl({
    @required String scheme,
    bool universalLinksOnly = false,
    bool forceWebView = false,
  }) async {
    await canLaunch(scheme)
        ? await launch(
            scheme,
            forceWebView: forceWebView,
            universalLinksOnly: universalLinksOnly,
          )
        : throw 'Couldn\'t launch $scheme';
  }

  void shareContent() {
    Share.share('Hello Baby');
    Share.share('Hi there', subject: 'Baby Shark');
  }

  void shareImage() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Share.shareFiles(['${directory.path}/Champions.jpeg'], text: 'Great Movie');
  }

  void sendEmail(String scheme) async {
    launchUrl(scheme: scheme);
  }

  void sendSMS(String scheme) async {
    launchUrl(scheme: scheme);
  }

  void makeCall(String scheme) async {
    launchUrl(scheme: scheme);
  }

  void openWebPage(String url) async {
    launchUrl(scheme: url);
  }

  void openWhatsAppChat(String scheme) async {
    launchUrl(scheme: scheme);
  }

  void openInstagramPage(String scheme) async {
    launchUrl(scheme: scheme, universalLinksOnly: true);
  }
}
