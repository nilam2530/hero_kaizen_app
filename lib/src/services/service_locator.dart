import 'package:get_it/get_it.dart';
import 'package:hero_kaizen_app/src/features/sidebar/controller/sidemenu_controller.dart';
import 'package:hero_kaizen_app/src/routing/route_config.dart';
import 'package:hero_kaizen_app/src/services/api_service.dart';
import 'package:hero_kaizen_app/src/services/http_interceptor.dart';
import 'package:hero_kaizen_app/src/services/logger.dart';
import 'package:hero_kaizen_app/src/services/token_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register the HttpInterceptor and ApiService
  getIt.registerSingleton<HttpInterceptor>(HttpInterceptor());
  getIt.registerSingleton<ApiService>(ApiService(getIt<HttpInterceptor>()));
  getIt.registerSingleton<TokenService>(TokenService());
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<AppLogger>(AppLogger());

  // Register Theme provider
  getIt.registerLazySingleton(() => SidemeuController());
}
