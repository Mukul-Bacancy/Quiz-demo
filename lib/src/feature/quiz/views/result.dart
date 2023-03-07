// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quiz_demo/mock_data/mock_data.dart';
import 'package:quiz_demo/src/feature/home/views/homepage.dart';

class Result extends StatelessWidget {
  final List<Question> questions;
  const Result({
    Key? key,
    required this.questions,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            generateResult(),
            OutlinedButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                  (route) => false),
              child: const Text('Go home'),
            ),
          ],
        ),
      ),
    );
  }

  Widget generateResult() {
    int count = 0;
    int length = questions.length;
    for (int i = 0; i < length; i++) {
      if(questions[i].correctAnswer_id  == questions[i].selectedAnswer_id) count++;
    }
    return Text('$count/$length');
  }
}
