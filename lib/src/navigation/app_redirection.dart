// import 'package:base_project/src/navigation/routes.dart';
// import 'package:dive_click/src/navigation/routes.dart';
// import 'package:dive_click/src/providers/app_startup_provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
//
// import '../core/repositories/auth/auth_api_repository.dart';
// import '../features/auth/domain/auth_repository.dart';
//
// sealed class AppRedirection {
//
//   static Future<String?> redirection(
//     BuildContext context,
//     GoRouterState state,
//     Ref ref,
//   ) async {
//     final isLogin = ref.read(authRepositoryProvider).isLogin;
//     final user = ref.read(authRepositoryProvider).user;
//     final isPublic = _isPublicRoute(state);
//
//     // print("++++++${state.fullPath}++++++ $isLogin $user");
//     // print('-------------$isLogin---------------');
//     if (!isLogin && isPublic) {
//       // print('pppppppppppp');
//       return null;
//       // return state.namedLocation(AppRoutes.onboard.name);
//     }
//
//     // if (state.fullPath?.isNotEmpty ?? false) {
//     //   final currentUser = FirebaseAuth.instance.currentUser;
//     //   print("===redirect==========${isLogin == null}================");
//     //   if (isLogin) {
//     //     return AppRoutes.home.path;
//     //   }else
//     //
//     if (!isLogin) {
//       return AppRoutes.onboard.path;
//     }
//     final isRouteExceptHome = _isRouteExceptHome(state);
//     if(!isRouteExceptHome){
//       final date = DateTime.now();
//       // print('6666666666666666 2222');
//       final data = await ref.read(appStartupProvider.future);
//       if (!data.allPresetsAreDownloaded &&
//           AppRoutes.home.path == (state.fullPath ?? '')) {
//         return AppRoutes.appLoading.path;
//       }
//       // print('6666666666666666 11111: ${DateTime.now().difference(date).inMilliseconds}');
//     }
//     return null;
//     // }
//     // return null;
//   }
//
//   static bool _isPublicRoute(GoRouterState state) {
//     final path = state.fullPath ?? '';
//     return AppRoutes.publicRoutes.any((route) => route.path == path);
//   }
//
//   static bool _isRouteExceptHome(GoRouterState state) {
//     final path = state.fullPath ?? '';
//     return AppRoutes.allRoutesExceptHome.any((route) => route.path == path);
//   }
//
// }
