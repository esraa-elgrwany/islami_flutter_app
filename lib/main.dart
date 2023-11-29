import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_project/hadethdetails.dart';
import 'package:islami_project/homeScreen.dart';
import 'package:islami_project/mythemedata.dart';
import 'package:islami_project/providers/my_provider.dart';
import 'package:islami_project/splash_screen.dart';
import 'package:islami_project/suradetails.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return  ScreenUtilInit(
      designSize: const Size(412, 873),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(pro.languageCode),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName:(context) => SplashScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          SuraDetails.routeName: (context) => SuraDetails(),
          HadethDetails.routeName: (context) => HadethDetails(),
        },
        themeMode: pro.modeApp,
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme,
      ),
    );
  }
}
