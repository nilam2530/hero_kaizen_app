import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hero_kaizen_app/src/common_widgets/custom_data_table/provider/custom_data_table_provider.dart';
import 'package:hero_kaizen_app/src/features/landing_dashboard/provider/landing_dashborad_controller.dart';
import 'package:hero_kaizen_app/src/features/view_request_status/provider/view_request_provider.dart';
import 'package:provider/provider.dart';
import 'package:hero_kaizen_app/l10n/localixation.dart';
import 'package:hero_kaizen_app/src/common_widgets/datetime/datetime_provider.dart';
import 'package:hero_kaizen_app/src/features/admin/Kaizen_loss/provider/kaizen_loss_provider.dart';
import 'package:hero_kaizen_app/src/features/admin/kaizen_pillar/provider/kaizen_pillar_controller.dart';
import 'package:hero_kaizen_app/src/features/admin/kaizen_benefit/provider/kaizen_benefit_provider.dart';
import 'package:hero_kaizen_app/src/features/authentication/login/provider/login_screen_provider.dart';
import 'package:hero_kaizen_app/src/features/sidebar/controller/sidemenu_controller.dart';
import 'package:hero_kaizen_app/src/routing/route_config.dart';
import 'package:hero_kaizen_app/src/themes/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routes = GetIt.I<AppRouter>().goRouter;
    var size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LocalizationProvider()),
        ChangeNotifierProvider(create: (_) => DateTimeProvider()),
        ChangeNotifierProvider(create: (_) => SidemeuController()),
        ChangeNotifierProvider(create: (_) => KaizenProvider()),
        ChangeNotifierProvider(create: (_) => KaizenBenefitProvider()),
        ChangeNotifierProvider(create: (_) => KaizenLossProvider()),
        ChangeNotifierProvider(create: (_) => CustomDataTableProvider()),
        ChangeNotifierProvider(create: (_) => RequestProvider()),

        ChangeNotifierProvider(create: (_) => LandingDashboardCOntroller()),

      ],
      child: Consumer2<ThemeProvider, LocalizationProvider>(
        builder: (context, themeProvider, localizationProvider, child) {
          return ScreenUtilInit(
            designSize: Size(size.width, size.height),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp.router(
              routerConfig: routes,
              debugShowCheckedModeBanner: false,
              restorationScopeId: 'app',
              onGenerateTitle: (BuildContext context) => 'My Pro',
              themeMode: context.watch<ThemeProvider>().themeMode,
              darkTheme: ThemeData(brightness: Brightness.dark),
              theme: ThemeData(
                  brightness: Brightness.light,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.black,
                    primary: Colors.black,
                  ),
                  useMaterial3: true,
                  textTheme: TextTheme(
                    bodySmall: TextStyle(
                        color: context.watch<ThemeProvider>().themeMode ==
                                ThemeMode.dark
                            ? Colors.white
                            : Colors.black),
                  )),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: context.watch<LocalizationProvider>().locale,
              supportedLocales: const [
                Locale('en', ''),
                Locale('hi', ''),
              ],
            ),
          );
        },
      ),
    );
  }
}
