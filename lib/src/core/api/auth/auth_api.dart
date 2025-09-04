import 'package:base_project/src/core/dto/user_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../api_client.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: '')
abstract class AuthApi {
  factory AuthApi() => _AuthApi(Api.client);

  @GET('/sign-in/{email}/{password}')
  Future<AppUserDTO?> getUserAchievements(
    @Path('email') String userId,
    @Path('password') String password,
  );
}
