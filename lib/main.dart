
import 'dart:ui';

import 'package:dive_click/src/app.dart';
import 'package:dive_click/src/providers/app_startup_provider.dart';
import 'package:dive_click/src/services/revenue_cat_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'globals/shared_pref_provider.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // await LutServices.saveNoPreset();
  // await LutServices.saveWatermarkLogo();
  // RevenueCatService.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  var prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const MainApp(),
    ),
  );
  final container = ProviderContainer();
  await container.read(appStartupProvider.future);
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
}
