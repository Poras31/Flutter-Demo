import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/data/model/response/json_two_dart_demo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ApiCallingDioScreen extends StatefulWidget {
  const ApiCallingDioScreen({Key? key}) : super(key: key);

  @override
  State<ApiCallingDioScreen> createState() => _ApiCallingDioScreenState();
}

class _ApiCallingDioScreenState extends State<ApiCallingDioScreen> {
  late Dio _apiClient;

  @override
  void initState() {
    //getDataFromAPi();
    _apiClient = Dio(BaseOptions(
      baseUrl:
          "https://jsonplaceholder.typicode.com", //in this dio package https is require.
      connectTimeout: const Duration(seconds: 3),
      sendTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ));
    _apiClient.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getDataFromAPi(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return showProductList(snapshot.data!);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future<Response> getDataFromAPi() async {
    //await Future.delayed(const Duration(seconds: 5));

    var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    var response =
        //await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
        await _apiClient.get(
      '/posts',
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    print('URL: $url');

    return response;
  }

  Widget showProductList(Response response) {
    List<JsonTwoDartDemo> productList =
        jsonEncode(response.data) as List<JsonTwoDartDemo>;

    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final user = productList[index];
        return Card(
          child: ListTile(
            title: Text(user.title),
            subtitle: Text(user.body),
          ),
        );
      },
      itemCount: productList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10.0,
        );
      },
    );
  }
}
