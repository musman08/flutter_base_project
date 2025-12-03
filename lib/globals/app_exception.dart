class AppException {
  AppException({
    this.code,
    this.error,
    required this.title,
    required this.message,
    this.stackTrace,
  });

  AppException.unknown(Object error, StackTrace stackTrace)
      : this(
          error: error,
          title: 'Unknown Error',
          message: error.toString(),
          stackTrace: stackTrace,
        );

  AppException.unableToSignInGeneral(Object error, StackTrace stackTrace)
      : this(
            error: error,
            stackTrace: stackTrace,
            title: 'Unable to sign in',
            message: 'You were not able to sign in. Please try again later. If '
                'the issue persists, please contact us at support@kingofthecurve.org'
            // message: 'You were not able to sign in, please try again in'
            //     ' some time, if the issue persists then please contact us',
            );

  factory AppException.withError(dynamic e) {
    var t = '';
    var err = e.toString();
    // if (e is DioException) {
    //   if (e.response != null) {
    //     if (e.response!.statusCode == 400) {
    //       t = 'Invalid User Data!';
    //       err = 'User with this email already exists!';
    //     }
    //   }
    // }
    return AppException(
      error: err,
      title: t,
      message: err,
    );
  }

  final String title;
  final String? code;
  final String message;

  Object? error;
  StackTrace? stackTrace;
}
