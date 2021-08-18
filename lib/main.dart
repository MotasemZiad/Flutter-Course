import 'package:flutter/material.dart';
import 'package:flutter_gsg_01/assignment/utils/constants.dart';
import 'package:flutter_gsg_01/state_management/helpers/db_helper.dart';
import 'package:flutter_gsg_01/state_management/ui/main_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorPrimary,
        fontFamily: 'Source Sans Pro',
      ),
      // darkTheme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}

// main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   GetIt.I.registerSingleton<DatabaseHelper>(DatabaseHelper());
//   GetIt.I.registerSingleton<SharedPreferencesHelper>(SharedPreferencesHelper());
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode
//           .system, // to show the theme of the system either dark or light
//       theme: ThemeData(
//         primarySwatch: colorPrimary,
//         fontFamily: 'Source Sans Pro',
//       ),
//       routes: {
//         '/': (context) => LoginScreen(),
//         '/register': (context) => RegisterScreen(),
//         '/home': (context) => HomeScreen(),
//         '/merchant': (context) => MerchantScreen(),
//         '/customer': (context) => CustomerScreen(),
//       },
//       navigatorKey: AppRouter.router.navigatorKey,
//       onGenerateRoute: (settings) {
//         return MaterialPageRoute(
//             builder: (context) => HomeScreen(settings.arguments));
//       },
//       onUnknownRoute: (settings) {
//         return MaterialPageRoute(builder: (context) => RegisterScreen());
//       },
//     );
//   }
// }

// main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();

//   runApp(
//     EasyLocalization(
//       child: MyApp(),
//       supportedLocales: [Locale('en'), Locale('ar')],
//       path: 'assets/lang',
//       fallbackLocale: Locale('en', 'US'),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           primarySwatch: kColorPrimary, fontFamily: 'Source Sans Pro'),
//       home: LocalizationScreen(),
//     );
//   }
// }

// return MaterialApp(
//   builder: (context, widget) => ResponsiveWrapper.builder(PhoneScreen(),
//       maxWidth: 1200,
//       minWidth: 480,
//       defaultScale: true,
//       breakpoints: [
//         ResponsiveBreakpoint.resize(480, name: MOBILE),
//         ResponsiveBreakpoint.autoScale(800, name: TABLET),
//         ResponsiveBreakpoint.resize(1000, name: DESKTOP),
//       ],
//       background: Container(color: Color(0xFFF5F5F5))),
//   debugShowCheckedModeBanner: false,
//   theme: ThemeData(
//       primarySwatch: kColorPrimary, fontFamily: 'Source Sans Pro'),
// );

/* 
 Container(
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
          child: ListView(
            children: vehicles
                .map((e) => CardWidget(
                      e,
                    ))
                .toList(),
          ),
        ),
*/
