import 'package:flutter/material.dart';

import 'screens/daily/screen.dart';

export 'screens/daily/screen.dart';
export 'screens/registration/screen.dart';
export 'screens/loading.dart';
export 'theme/app_theme.dart';

/// Well, for now we are using SPA architecture, would been better if we foreseen it
final Map<String, WidgetBuilder> initialRoutes = <String, WidgetBuilder>{
  "/": (BuildContext context) => DailyScreen(),
  "/daily": (BuildContext context) => DailyScreen(),
};
