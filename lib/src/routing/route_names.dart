enum AppRoute {
  splash,
  login,
  mainScreen,
  requests,
  locations,
  kaizenPillarView,
  kaizenAddPillar,
  kaizenTheme,
  kaizenAddTheme,
  kaizenLoss,
  kaizenAddLoss,
  requestStatus,



}

extension AppRouteExt on AppRoute {
  String get getPath {
    switch (this) {
      case AppRoute.splash:
        return '/';
      case AppRoute.login:
        return '/login';
      case AppRoute.mainScreen:
        return '/mainScreen';
      case AppRoute.requests:
        return '/requests';
      case AppRoute.locations:
        return '/locations';
      case AppRoute.kaizenPillarView:
        return '/kaizenPillarView';
      case AppRoute.kaizenAddPillar:
        return '/kaizenAddPillar';
      case AppRoute.kaizenTheme:
        return '/kaizenTheme';
      case AppRoute.kaizenAddTheme:
        return '/kaizenAddTheme';
      case AppRoute.kaizenLoss:
        return '/kaizenLoss';
      case AppRoute.kaizenAddLoss:
        return '/kaizenAddLoss';
      case AppRoute.requestStatus:
        return '/requestStatus';
      default:
        return '/login';
    }
  }

  String get getName {
    switch (this) {
      case AppRoute.splash:
        return 'splash';
      case AppRoute.login:
        return 'login';
      case AppRoute.mainScreen:
        return 'mainScreen';
      case AppRoute.requests:
        return 'requests';
      case AppRoute.locations:
        return 'locations';
      case AppRoute.kaizenPillarView:
        return 'kaizenPillarView';
      case AppRoute.kaizenAddPillar:
        return 'kaizenAddPillar';
      case AppRoute.kaizenTheme:
        return 'kaizenTheme';
      case AppRoute.kaizenAddTheme:
        return 'kaizenAddTheme';
      case AppRoute.kaizenLoss:
        return 'kaizenLoss';
      case AppRoute.kaizenAddLoss:
        return 'kaizenAddLoss';
      case AppRoute.requestStatus:
        return 'requestStatus';
      default:
        return 'login';
    }
  }
}
