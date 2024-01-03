import 'dart:convert';

import 'package:chat_ui_demo/core/locator/locator.dart';
import 'package:chat_ui_demo/service/enc_service.dart';
import 'package:dio/dio.dart';

class CustomInterceptors extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['content-type'] = 'text/plain';
    options.headers['contentType'] = 'text/plain';
    options.headers['responseType'] = 'text/plain';
    options.responseType = ResponseType.plain;

    /// TODO: Uncomment below code in production app
    //options.headers.putIfAbsent("api-key", () => appDB.apiKey);
    // if (appDB.token.isNotEmpty) {
    //   options.headers['token'] = enc.encrypt(appDB.token);
    // }
    // if (options.data != null) {
    //   options.data = enc.encrypt(jsonEncode(options.data));
    // }

    return handler.next(options);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final enc = locator.get<EncService>();
    response.data = jsonDecode(enc.decrypt(response.data.toString()));
    return handler.next(response);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}
