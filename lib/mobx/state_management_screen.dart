import 'package:auto_route/auto_route.dart';
import 'package:chat_ui_demo/app_router/app_router.dart';
import 'package:chat_ui_demo/mobx/store/counter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class StatemanagementScreen extends StatefulWidget {
  const StatemanagementScreen({Key? key}) : super(key: key);

  @override
  State<StatemanagementScreen> createState() => _StatemanagementScreenState();
}

class _StatemanagementScreenState extends State<StatemanagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'State Management',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //counter increment
          counter.increment();
          print("Counter ${counter.count}");
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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
              AutoRouter.of(context).push(StatemanagementRouteTwo());
            },
            child: const Text(
              'Next Screen',
            ),
          ),
        ],
      ),
    );
  }
}
