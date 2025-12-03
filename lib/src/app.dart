
import 'package:dive_click/src/navigation/app_nav.dart';
import 'package:dive_click/src/providers/app_dir_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  static Future<void> init() async {
    print('Hellooooo world 3');
    print('Hellooooo world 4');
  }

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    print('Hellooooo world 1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Hellooooo world 2');
    ref.watch(appDirProvider);

    return MaterialApp.router(
      routerConfig: ref.watch(routerConfigProvider),
      debugShowCheckedModeBanner: false,
      title: 'Dive Click',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
      ),
    );
  }
}
