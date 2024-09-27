import 'package:catcher/catcher.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hero_kaizen_app/src/services/firebase_services/firebase_options.dart';
import 'package:hero_kaizen_app/src/models/vistor_model.dart';
import 'package:hero_kaizen_app/src/services/service_locator.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // ScreenUtil package import

void main() async {
  await dotenv.load(fileName: ".env");

  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  analytics.setAnalyticsCollectionEnabled(true);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(VisitorAdapter());
  await Hive.openBox<Visitor>('visitors');

  CatcherOptions debugOptions = CatcherOptions(
    DialogReportMode(),
    [ConsoleHandler()],
  );

  CatcherOptions releaseOptions = CatcherOptions(
    SilentReportMode(),
    [
      ConsoleHandler(),
      EmailManualHandler(['shivendramanitripathi549@gmail.com'])
    ],
  );

  // Initialize Catcher with ScreenUtil
  Catcher(
    rootWidget: ScreenUtilInit(
      designSize: const Size(375, 812), // Your default design size
      minTextAdapt: true,
      builder: (context, child) {
        return const MyApp();
      },
    ),
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
  );
}
