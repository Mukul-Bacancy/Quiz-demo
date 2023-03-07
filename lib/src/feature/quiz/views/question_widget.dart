// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:quiz_demo/mock_data/mock_data.dart';
import 'package:quiz_demo/src/feature/quiz/controller/quiz_controller.dart';
import 'package:quiz_demo/src/feature/quiz/views/result.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final QuizController quizController;
  final List<Question> qlist;

  const QuestionWidget({
    Key? key,
    required this.question,
    required this.quizController,
    required this.qlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(question.question),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              children: <TableRow>[
                TableRow(
                  children: [
                    TableCell(
                      child: OutlinedButton(
                        onPressed: () {
                          question.selectedAnswer_id = question.answers[0].a_id;
                          selectAnswer(
                              quizController.currentQuestionIndex.value,
                              context);
                        },
                        child: Text(question.answers[0].answer),
                      ),
                    ),
                    TableCell(
                      child: OutlinedButton(
                        onPressed: () {
                          question.selectedAnswer_id = question.answers[1].a_id;
                          selectAnswer(
                              quizController.currentQuestionIndex.value,
                              context);
                        },
                        child: Text(question.answers[1].answer),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: OutlinedButton(
                        onPressed: () {
                          question.selectedAnswer_id = question.answers[2].a_id;
                          selectAnswer(
                              quizController.currentQuestionIndex.value,
                              context);
                        },
                        child: Text(question.answers[2].answer),
                      ),
                    ),
                    TableCell(
                      child: OutlinedButton(
                        onPressed: () {
                          question.selectedAnswer_id = question.answers[3].a_id;
                          selectAnswer(
                              quizController.currentQuestionIndex.value,
                              context);
                        },
                        child: Text(question.answers[3].answer),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  selectAnswer(int currentQuestionIndex, BuildContext context) {
    if (currentQuestionIndex == quizController.numOfQuestions - 1) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          icon: const Icon(
            Icons.warning,
            color: Colors.green,
          ),
          content: OutlinedButton(
            onPressed: () {
              quizController.toResultNavigation();
            },
            child: const Text('Finish Quiz'),
          ),
        ),
      );
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const Result(),
      //     ),
      //     (route) => false);
    } else {
      quizController.nextQuestion();
    }
  }
}
