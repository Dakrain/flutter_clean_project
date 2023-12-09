import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'generated/l10n.dart';

void main() async {
  // Ensure Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize GetIt for dependency injection
  GetIt getIt = GetIt.instance;

  // Initialize Flutter Local Notifications
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize Crashlytics
  if (!kDebugMode) {
    // Pass all uncaught errors to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = injector.get<AppRouter>();

    return MaterialApp.router(
      title: 'Flutter Base Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: appRouter.delegate(
        deepLinkBuilder: (deepLink) {
          return const DeepLink([]);
        },
        navigatorObservers: () => [NavigatorObserver()],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Base Project'),
      ),
      body: Center(
        child: Text('Welcome to Flutter Base Project'),
      ),
    );
  }
}





   "JavascriptBridge"
      "LinkNowWithPermission"
        "Disconnect"
     "observer"
      "OpenWebviewInWebview"
       "CloseCurrentWebview"
         "EditPermission"
   "LinkPermissionPhoto"