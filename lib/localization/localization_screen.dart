import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';

class LocalizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('name'.tr()),
        actions: [
          IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                context.setLocale(
                  context.locale == Locale('ar') ? Locale('en') : Locale('ar'),
                );
                print(context.locale.toString());
              })
        ],
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            mainAxisExtent: 300,
          ),
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //   childAspectRatio: 1, // show the percentage of height to width
          //   crossAxisCount: 2,
          //   mainAxisSpacing: 4.0,
          //   crossAxisSpacing: 4.0,
          //   mainAxisExtent: 300,
          // ),
          itemBuilder: (context, index) {
            return Container(
                child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    movies[index].imgAsset,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 30.0,
                          color: Colors.red,
                        ),
                        onPressed: () {}),
                  ),
                ),
              ],
            ));
          },
          itemCount: movies.length,
          reverse: true,
          // scrollDirection: Axis.horizontal,
          physics:
              BouncingScrollPhysics(), // How the scrolling behavior look like
        ),
      ),
    );
  }
}
