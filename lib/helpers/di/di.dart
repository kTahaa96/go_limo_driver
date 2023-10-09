import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:golimo_driver/feature/home_page/cubit/home_lay_out_cubit.dart';
import 'package:golimo_driver/feature/login/cubit/login_cubit.dart';
import 'package:golimo_driver/feature/modules/home/cubit/home_cubit.dart';
import 'package:golimo_driver/feature/splash/cubit/splash_cubit.dart';
import 'package:golimo_driver/helpers/local/cache_helper.dart';
import 'package:golimo_driver/helpers/location_helper/cubit/location_cubit.dart';
import 'package:golimo_driver/helpers/network/cubit/cubit.dart';
import 'package:golimo_driver/helpers/network/dio/dio_helper.dart';
import 'package:golimo_driver/helpers/network/dio/wrapper.dart';
import 'package:golimo_driver/helpers/network/repository.dart';
import 'package:golimo_driver/helpers/network/repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

GetIt di = GetIt.I;

Future init() async {
  await dotenv.load(fileName: ".env");
  final sp = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => sp);
  final userAgent = await userAgentClientHintsHeader();
  di.registerLazySingleton<NetworkCubit>(
    () => NetworkCubit(),
  );
  di.registerLazySingleton<DioHelper>(
    () => DioImpl(
      userAgent: userAgent.values.first.toString(),
      baseURL: dotenv.env['BASE_URL']!,
      onRequest: di<NetworkCubit>().onRequestCallback,
      onError: di<NetworkCubit>().onErrorCallback,
    ),
  );

  di.registerLazySingleton<Repository>(() => RepoImpl(dioHelper: di<DioHelper>()));
  di.registerLazySingleton<CacheHelper>(() => CacheImpl(di<SharedPreferences>()));
  di.registerFactory<SplashCubit>(() => SplashCubit());
  di.registerFactory<LoginCubit>(() => LoginCubit(repository: di<Repository>()));
  di.registerFactory<LocationCubit>(() => LocationCubit(repository: di<Repository>()));
  di.registerFactory<HomeLayOutCubit>(() => HomeLayOutCubit());
  di.registerFactory<HomeCubit>(() => HomeCubit());
}
