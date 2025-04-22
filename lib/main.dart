import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permissions_app/features/auth/presentation/provider/data_source_provider.dart';
import 'package:permissions_app/features/auth/presentation/provider/privacy_policy_provider.dart';
import 'package:permissions_app/features/auth/presentation/provider/user_info_controller.dart.dart';
import 'package:permissions_app/features/splash/provider/splash_provider.dart';
import 'package:permissions_app/features/splash/view/splash_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashController()),
        ChangeNotifierProvider(create: (_) => UserInfoController()),
        ChangeNotifierProvider(create: (_) => DataSourceController()),
        ChangeNotifierProvider(create: (_) => PrivacyPolicyProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        responsiveWidgets: [MaterialApp.router.toString()],
        splitScreenMode: true,
        builder: (context, child) {
          SystemChrome.setPreferredOrientations(
            [
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ],
          );
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Permissions App',
            home: SplashView(),
          );
        });
  }
}
