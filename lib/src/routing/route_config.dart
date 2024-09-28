import 'package:go_router/go_router.dart';
import 'package:hero_kaizen_app/src/features/admin/Kaizen_loss/add_loss.dart';
import 'package:hero_kaizen_app/src/features/admin/Kaizen_loss/kaizen_loss_view.dart';
import 'package:hero_kaizen_app/src/features/admin/kaizen_pillar/kaizen_pillar_view.dart';
import 'package:hero_kaizen_app/src/features/admin/kaizen_benefit/add_benefit.dart';
import 'package:hero_kaizen_app/src/features/admin/kaizen_theme/kaizen_theme_view.dart';
import 'package:hero_kaizen_app/src/features/authentication/login/login_screen.dart';
import 'package:hero_kaizen_app/src/features/dashboard/dashboard.dart';
import 'package:hero_kaizen_app/src/features/edit_request/edit_request.dart';
import 'package:hero_kaizen_app/src/features/kaizenform/kaizen_tabs.dart';
import 'package:hero_kaizen_app/src/features/locations/location_screen.dart';
import 'package:hero_kaizen_app/src/features/splash/splash_screen.dart';
import 'package:hero_kaizen_app/src/features/tables/AddRequest.dart';
import 'package:hero_kaizen_app/src/features/view_request/view_request.dart';
import 'package:hero_kaizen_app/src/routing/not_found_screen.dart';
import 'package:hero_kaizen_app/src/routing/route_names.dart';
import 'package:hero_kaizen_app/src/features/sidebar/shell_layout.dart';
import '../features/admin/kaizen_benefit/kaizen_benifit_view.dart';
import '../features/admin/kaizen_pillar/add_pillar_view.dart';
import '../features/view_request_status/view_request.dart';

class AppRouter {
  late final GoRouter goRouter;

  AppRouter() {
    goRouter = GoRouter(
      initialLocation: '/login',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: AppRoute.splash.getPath,
          name: AppRoute.splash.getName,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoute.login.getPath,
          name: AppRoute.login.getName,
          builder: (context, state) => const LoginScreen(),
        ),
        // Define a ShellRoute for the side menu and dashboard screens
        ShellRoute(
          builder: (context, state, child) {
            return ShellLayout(child: child); // Your shell layout widget
          },
          routes: [
            GoRoute(
              path: '/mainScreen',
              builder: (context, state) => const Dashboard(),
            ),
            GoRoute(
              path: '/requests',
              builder: (context, state) => const AddRequest(),
            ),
            GoRoute(
              path: '/editrequest',
              builder: (context, state) => const EditRequestScreen(),
            ),
            GoRoute(
              path: '/viewrequest',
              builder: (context, state) => const ViewRequestScreen(),
            ),
            GoRoute(
              path: '/location',
              builder: (context, state) => const LocationScreen(),
            ),
            GoRoute(
              path: '/kaizenform',
              builder: (context, state) => const KaizensTabs(),
            ),
            //Kaizen Admin
            GoRoute(
              path: AppRoute.kaizenPillarView.getPath,
              name: AppRoute.kaizenPillarView.getName,
              builder: (context, state) => const KaizenPillarView(),
            ),
            GoRoute(
              path: AppRoute.kaizenTheme.getPath,
              name: AppRoute.kaizenTheme.getName,
              builder: (context, state) => const KaizenThemeView(),
            ),
            GoRoute(
              path: AppRoute.kaizenAddPillar.getPath,
              name: AppRoute.kaizenAddPillar.getName,
              builder: (context, state) => const AddPillarView(),
            ),
            GoRoute(
              path: AppRoute.kaizenAddTheme.getPath,
              name: AppRoute.kaizenAddTheme.getName,
              builder: (context, state) => const AddBenefitView(),
            ),
            GoRoute(
              path: AppRoute.kaizenLoss.getPath,
              name: AppRoute.kaizenLoss.getName,
              builder: (context, state) => const KaizenLossView(),
            ),
            GoRoute(
              path: AppRoute.kaizenAddLoss.getPath,
              name: AppRoute.kaizenAddLoss.getName,
              builder: (context, state) => const AddLoss(),
            ),
            GoRoute(
              path: AppRoute.requestStatus.getPath,
              name: AppRoute.requestStatus.getName,
              builder: (context, state) => ViewRequestStatus(),
            ),
            GoRoute(
              path: AppRoute.kaizenBenefit.getPath,
              name: AppRoute.kaizenBenefit.getName,
              builder: (context, state) => const KaizenBenefitView(),
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => const NotFoundScreen(),
    );
  }
}
