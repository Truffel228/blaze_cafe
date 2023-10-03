import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:blaze_cafe/notification_service/firebase_options.dart';
import 'package:blaze_cafe/notification_service/notification_service.dart';
import 'package:blaze_cafe/router.dart';
import 'package:blaze_cafe/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );

  AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
      afDevKey: 'dwjUGVJAgeZxDYeqNmddh',
      appId: '6467491271',
      showDebug: false,
      timeToWaitForATTUserAuthorization: 50, // for iOS 14.5
      disableAdvertisingIdentifier: false, // Optional field
      disableCollectASA: false); // Optional field

  AppsflyerSdk appsflyerSdk = AppsflyerSdk(appsFlyerOptions);

  await NotificationServiceFb().activate();

  runApp(MyApp(appsflyerSdk));
}

class MyApp extends StatelessWidget {
  MyApp(this._appsflyerSdk, {super.key});
  final AppsflyerSdk _appsflyerSdk;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _appsflyerSdk,
      child: MaterialApp.router(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
