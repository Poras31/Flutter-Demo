import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/ui/dashboard/api_calling/model/product_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class ApiCallingScreen extends StatefulWidget {
  const ApiCallingScreen({Key? key}) : super(key: key);

  @override
  State<ApiCallingScreen> createState() => _ApiCallingScreenState();
}

class _ApiCallingScreenState extends State<ApiCallingScreen> {
  @override
  void initState() {
    //getDataFromAPi();
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

  Future<http.Response> getDataFromAPi() async {
    //await Future.delayed(const Duration(seconds: 5));

    var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    var response =
        //await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
        await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('URL: $url');

    return response;
  }
}

Widget showProductList(http.Response response) {
  List<ProductResponse> productList = productResponseFromJson(response.body);

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

/*
* with dio first we need to initialize */
