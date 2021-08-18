import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/local_storage/constants.dart';
import 'package:flutter_gsg_01/local_storage/helper/url_launcher_helper.dart';

class UrlScreen extends StatelessWidget {
  String getEmailScheme({
    @required String mailto,
    @required String subject,
    @required String body,
  }) =>
      'mailto:$mailto?subject=$subject&body=$body';

  String getPhoneScheme(String phoneNumber) => 'tel:$phoneNumber';

  String getSmsScheme(String phoneNumber) => 'sms:$phoneNumber';

  String getWhatsAppScheme(String phoneNumber) => 'https://wa.me/$phoneNumber';

  String getInstagramScheme(String profilePage) =>
      'https://www.instagram.com/$profilePage/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Launch URLs'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                try {
                  UrlLauncherHelper.urlLauncherHelper
                      .makeCall(getPhoneScheme('0598722833'));
                } on Exception catch (e) {
                  print(e);
                }
              },
              child: Text(
                'Make a call',
                style: textButtonStyle,
              ),
            )),
            SizedBox(
              height: 6.0,
            ),
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                try {
                  UrlLauncherHelper.urlLauncherHelper.openWebPage(urlFlutter);
                } on Exception catch (e) {
                  print(e);
                }
              },
              child: Text(
                'Open Web Page',
                style: textButtonStyle,
              ),
            )),
            SizedBox(
              height: 6.0,
            ),
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                try {
                  UrlLauncherHelper.urlLauncherHelper
                      .sendSMS(getSmsScheme('0599369350'));
                } on Exception catch (e) {
                  print(e);
                }
              },
              child: Text(
                'Send SMS',
                style: textButtonStyle,
              ),
            )),
            SizedBox(
              height: 6.0,
            ),
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                try {
                  UrlLauncherHelper.urlLauncherHelper
                      .openWebPage(getEmailScheme(
                    mailto: 'angela@gmail.com',
                    subject: 'Flutter bootcamp',
                    body:
                        'Elit exercitation eiusmod consequat labore eiusmod labore dolore laboris nulla. Ipsum tempor ex fugiat minim in. Duis cillum nostrud aliqua in sit eiusmod. Reprehenderit veniam ea tempor ut consectetur ipsum quis irure in enim duis nisi nisi consequat. Dolore quis deserunt ad occaecat qui quis incididunt tempor ad. Labore elit excepteur excepteur magna eu deserunt id cillum est. Enim elit aute eu magna id aliqua culpa id consectetur cillum consequat esse.',
                  ));
                } on Exception catch (e) {
                  print(e);
                }
              },
              child: Text(
                'Send Email',
                style: textButtonStyle,
              ),
            )),
            SizedBox(
              height: 6.0,
            ),
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                UrlLauncherHelper.urlLauncherHelper
                    .openWhatsAppChat(getWhatsAppScheme('+970598926087'));
              },
              child: Text(
                'Open WhatsApp Chat',
                style: textButtonStyle,
              ),
            )),
            SizedBox(
              height: 6.0,
            ),
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                UrlLauncherHelper.urlLauncherHelper
                    .openInstagramPage(getInstagramScheme('palestino_free'));
              },
              child: Text(
                'Open Instagram Page',
                style: textButtonStyle,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
