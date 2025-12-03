import 'dart:developer';
import 'package:base_project/src/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'app_redirection.dart';


final _navigatorKey = GlobalKey<NavigatorState>();

final routerConfigProvider = Provider<GoRouter>((ref) {
  StatefulNavigationShell? navShell;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  return GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: AppRoutes.initialLocation,
    debugLogDiagnostics: true,
    // redirect: (context, state) {
    //   return AppRedirection.redirection(context, state, ref);
    // },
    routes: [
      // GoRoute(
      //   path: AppRoutes.onboard.path,
      //   name: AppRoutes.onboard.name,
      //   builder: OnboardPage.route,
      // ),
      // GoRoute(
      //   path: AppRoutes.signIn.path,
      //   name: AppRoutes.signIn.name,
      //   builder: SignInPage.route,
      // ),
      // GoRoute(
      //   path: AppRoutes.signUp.path,
      //   name: AppRoutes.signUp.name,
      //   builder: SignUpPage.route,
      // ),
      // GoRoute(
      //   path: AppRoutes.forgetPass.path,
      //   name: AppRoutes.forgetPass.name,
      //   builder: ForgetPassPage.route,
      // ),
      // GoRoute(
      //   path: AppRoutes.appLoading.path,
      //   name: AppRoutes.appLoading.name,
      //   builder: AppLoadingScreen.route,
      // ),
      // GoRoute(
      //   path: AppRoutes.home.path,
      //   name: AppRoutes.home.name,
      //   builder: HomePage.route,
      // ),
      // GoRoute(
      //   path: AppRoutes.settings.path,
      //   name: AppRoutes.settings.name,
      //   builder: SettingPage.route,
      // ),
      // GoRoute(
      //   path: AppRoutes.editProfile.path,
      //   name: AppRoutes.editProfile.name,
      //   builder: EditProfilePage.route,
      // ),
      // GoRoute(
      //   // onExit: (context, state) {
      //   //   final filePath = state.uri.queryParameters["file"] ?? "";
      //   //   log('onExit filePath: ${filePath}');
      //   //   ref.invalidate(commandProvider(filePath));
      //   //   ref.invalidate(adjustFilterProvider(filePath));
      //   //   ref.invalidate(imageFilterProvider(filePath));
      //   //   ref.invalidate(videoFilterProvider(filePath));
      //   //   return true;
      //   // },
      //   path: AppRoutes.editor.path,
      //   name: AppRoutes.editor.name,
      //   builder: EditPage.route,
      //   routes: [
      //     GoRoute(
      //       path: AppRoutes.mediaSaved.path,
      //       name: AppRoutes.mediaSaved.name,
      //       builder: MediaSaved.route,
      //     ),
      //   ],
      // ),
    ],
  );
});
