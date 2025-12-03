enum AppRoutes {
  signIn('sign-in', '/sign-in'),
  signUp('sign-up', '/sign-up'),
  onboard('onboard', '/onboard'),
  forgetPass('forget-pass', '/forget-pass'),
  appLoading('app-loading', '/app-loading'),
  home('home', '/home'),
  settings('settings', '/setting'),
  profile('profile', '/profile'),
  editProfile('edit-Profile', '/edit-Profile'),
  editor('editor', '/editor'),
  mediaSaved('media-saved', '/media-saved')
  ;

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);

  static String get initialLocation => AppRoutes.home.path;

  static List<AppRoutes> get publicRoutes => [
    AppRoutes.signIn,
    AppRoutes.signUp,
    AppRoutes.forgetPass,
    AppRoutes.onboard,
  ];
  static List<AppRoutes> get allRoutesExceptHome => [
    AppRoutes.settings,
    AppRoutes.profile,
    AppRoutes.editProfile,
    AppRoutes.editor,
    AppRoutes.mediaSaved,
  ];
  static List<AppRoutes> privatePages = [
    AppRoutes.home,
    AppRoutes.settings,
    AppRoutes.profile,
  ];

  static List<AppRoutes> bottomNavPages = [
    AppRoutes.home,
    AppRoutes.settings,
  ];
}
