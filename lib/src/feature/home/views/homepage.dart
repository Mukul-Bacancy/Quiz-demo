import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/src/feature/home/controller/homepage_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final startQuizController = Get.put(
    HomePageController(),
  );

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            startQuizController.startQuiz();
          },
          child: const Text('Start Quiz'),
        ),
      ),
    );
  }
}
