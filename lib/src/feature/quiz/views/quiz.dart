// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz_demo/mock_data/mock_data.dart';
import 'package:quiz_demo/src/feature/quiz/controller/quiz_controller.dart';
import 'package:quiz_demo/src/feature/quiz/views/question_widget.dart';

class Quiz extends StatefulWidget {
  final List<Question> quizQuestions;

  const Quiz({
    Key? key,
    required this.quizQuestions,
  }) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late final QuizController quizController;
  final List<Widget> questionWidgets = [];
  bool timeEnded = false;

  @override
  void initState() {
    super.initState();
    quizController = Get.put(
      QuizController(
        numOfQuestions: widget.quizQuestions.length,
        quiz: widget.quizQuestions,
      ),
    );

    createQuestions(widget.quizQuestions);
  }

  createQuestions(List<Question> questions) {
    for (int i = 0; i < widget.quizQuestions.length; i++) {
      questionWidgets.add(
        QuestionWidget(
            question: widget.quizQuestions[i],
            quizController: quizController,
            qlist: widget.quizQuestions),
      );
    }
  }

  @override
  void dispose() {
    quizController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Obx(
            () => Text(quizController.time.value.toString()),
          ),
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                if (quizController.currentQuestionIndex.value == 0) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      icon: const Icon(
                        Icons.crisis_alert,
                        color: Colors.red,
                      ),
                      content: OutlinedButton(
                        onPressed: () {
                          quizController.toHomeNavigation();
                        },
                        child: const Text('End Quiz'),
                      ),
                    ),
                  );
                } else {
                  quizController.previousQuestion();
                }
              },
              icon: const Icon(Icons.arrow_back),
            );
          },
        ),
        title: const Text('Quiz'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => quizController.currentQuestionIndex.value !=
                        widget.quizQuestions.length
                    ? questionWidgets
                        .elementAt(quizController.currentQuestionIndex.value)
                    : Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        if (quizController.currentQuestionIndex.value == 0) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              icon: const Icon(
                                Icons.crisis_alert,
                                color: Colors.red,
                              ),
                              content: OutlinedButton(
                                onPressed: () {
                                  quizController.toHomeNavigation();
                                  //quizController.dispose();
                                },
                                child: const Text('End Quiz'),
                              ),
                            ),
                          );
                        } else {
                          quizController.previousQuestion();
                        }
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (quizController.currentQuestionIndex.value ==
                            quizController.numOfQuestions - 1) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              icon: const Icon(
                                Icons.crisis_alert,
                                color: Colors.green,
                              ),
                              content: OutlinedButton(
                                onPressed: () {
                                  //quizController.dispose();
                                  quizController.toResultNavigation();
                                },
                                child: const Text('Finish Quiz'),
                              ),
                            ),
                          );
                        } else {
                          quizController.nextQuestion();
                        }
                      },
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
