import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/alert_message.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/core/consts/strings.dart';
import 'package:golimo_driver/feature/home_page/home_layout.dart';
import 'package:golimo_driver/feature/splash/cubit/splash_cubit.dart';
import 'package:golimo_driver/helpers/di/di.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_routes.dart';
import 'package:golimo_driver/helpers/network/cubit/cubit.dart';
import 'package:golimo_driver/helpers/network/cubit/state.dart';
import 'package:golimo_driver/helpers/network/extensions/http_overrides.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetworkCubit>(
          create: (BuildContext context) => di<NetworkCubit>(),
        ),
        BlocProvider(create: (context) => di<SplashCubit>()..switchAnimation()),
      ],
      child: BlocListener<NetworkCubit, NetworkStates>(
        listenWhen: (previous, current) {
          return previous.runtimeType != current.runtimeType;
        },
        listener: (BuildContext context, NetworkStates state) {
          switch (state.runtimeType) {
            case UnauthenticatedState:
              PopUpHelper.showSnakeBar(message: Strings.unauthenticatedMessage);
              NamedNavigatorImpl.push(Routes.login, clean: true);
              return;
            case SocketErrorState:
              PopUpHelper.showSnakeBar(message: "Internet Connection Error");
              break;
            case ClientErrorState:
              break;
            case ServerErrorState:
              break;
            case ErrorState:
              break;
            default:
          }
        },
        child: ScreenUtilInit(
          designSize: const Size(411, 843),
          minTextAdapt: true,
          splitScreenMode: false,
          builder: (_, child) => MaterialApp(
            onGenerateRoute: NamedNavigatorImpl.onGenerateRoute,
            navigatorKey: NamedNavigatorImpl.navigatorState,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("ar"),
            ],
            title: 'Go Limo App',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.kBackground,
              fontFamily: "Alexandria",
              appBarTheme:  AppBarTheme(
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  fontFamily: 'Alexandria',
                  color:AppColors.kBlack,
                ),
                color: AppColors.kPrimary,
                elevation: 0,
              ),
              primaryColor: AppColors.kPrimary,
            ),
            home: const HomePage(),
            // home: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
