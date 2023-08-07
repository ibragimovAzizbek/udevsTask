import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'To do',
          theme: theme(),
          onGenerateRoute: RouterController.inherentce.onGenerateRoute,
          initialRoute: '/main',
        );
      },
    );
  }
}