import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Homepage'),
      ),
      body: Center(
        child: Obx(() => Text('Counter value is ${counterController.count}')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
