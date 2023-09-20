import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class Controller extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter.value++;
  }
}

class MyApp extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(controller),
    );
  }
}

class HomePage extends GetView<Controller> {
  HomePage(this.controller);

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Challenge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: Obx(() => Text(
                        '${controller.counter.value}',
                        style: TextStyle(fontSize: 24),
                      )),
                )),
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.increment();
                    },
                    child: Text('+'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.counter.value--;
                    },
                    child: Text('-'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
