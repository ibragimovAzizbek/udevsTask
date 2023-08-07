import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/config/theme/app_theme.dart';
import 'package:todoapp/feature/calendar/presentation/bloc/local/local_to_do_bloc.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LocalToDoCubit())],
      child: const MyApp()));
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
