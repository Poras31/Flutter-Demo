import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/mobx/store/counter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class StatemanagementScreenTwo extends StatefulWidget {
  StatemanagementScreenTwo({Key? key}) : super(key: key);

  @override
  State<StatemanagementScreenTwo> createState() =>
      _StatemanagementScreenTwoState();
}

class _StatemanagementScreenTwoState extends State<StatemanagementScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Observer(
              // this is for rebuild the ui.
              builder: (context) => Text(
                counter.count.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (counter.count == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Count is 0")));
                } else {
                  counter.decrement();
                }
              },
              child: const Text('Decrement'))
        ],
      ),
    );
  }
}
