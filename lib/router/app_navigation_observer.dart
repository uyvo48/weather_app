import 'package:flutter/material.dart';

import '../util/app_log.dart';

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLog.debug(
      "push: ${previousRoute?.settings.name ?? '/'} -> ${route.settings.name}",
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLog.debug(
      "pop: ${previousRoute?.settings.name ?? '/'} -> ${route.settings.name}",
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    AppLog.debug(
      "replace: ${oldRoute?.settings.name ?? '/'} -> ${newRoute?.settings.name}",
    );
  }
}
