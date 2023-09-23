import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:blaze_cafe/router.dart';
import 'package:blaze_cafe/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("f7e66704-ad32-4080-b759-6a22a7fe2116");
  OneSignal.Notifications.requestPermission(true);

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
