import 'package:chat_ui_demo/core/api/base_response/base_response.dart';
import 'package:chat_ui_demo/data/model/request/login_request_model.dart';
import 'package:chat_ui_demo/data/model/response/user_profile_response.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserData?>> signIn(LoginRequestModel data);

  Future<BaseResponse> logout();
}
