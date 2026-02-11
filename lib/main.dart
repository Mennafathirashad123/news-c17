import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/core/resources/app_theme.dart';
import 'package:news_c17/core/resources/routes_manager.dart';
import 'package:news_c17/ui/home/screen/home_screen.dart';

void main() {
  ApiManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'News App',
          routes:{
            RoutesManager.home:(_)=>HomeScreen()
          },
          theme: AppTheme.lightTheme,
          initialRoute: RoutesManager.home,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

