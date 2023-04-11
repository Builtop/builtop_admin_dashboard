import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/theme.dart';
import 'package:builtop_admin_dashboard/routes/app_routes.dart';
import 'package:builtop_admin_dashboard/routes/app_routes.gr.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';
import 'package:lifecycle/lifecycle.dart' show defaultLifecycleObserver;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ConfigService.init();

  var delegate = await LocalizationDelegate.create(
      fallbackLocale: ConfigService.getValueString('language') == ''
          ? 'en'
          : ConfigService.getValueString('language'),
      supportedLocales: ['en', 'ar']);

  usePathUrlStrategy();
  runApp(
    LocalizedApp(delegate, MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: ValueListenableBuilder(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp.router(
            locale: AppConfigService.isArabic
                ? const Locale('ar')
                : const Locale('en'),
            supportedLocales: localizationDelegate.supportedLocales,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
              localizationDelegate
            ],
            routerDelegate: AutoRouterDelegate(_appRouter,
                navigatorObservers: () => [defaultLifecycleObserver]),
            routeInformationParser: _appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
            theme: ThemeClass.themeData(value, context),
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.trackpad,
                PointerDeviceKind.unknown
              },
            ),
            title: 'AdminKit',
          );
        },
        valueListenable: AppConfigService.darkNotifier,
      ),
    );
  }
}
