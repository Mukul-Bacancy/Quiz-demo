// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:get/get.dart';

import 'package:quiz_demo/mock_data/mock_data.dart';
import 'package:quiz_demo/src/feature/home/views/homepage.dart';
import 'package:quiz_demo/src/feature/quiz/views/result.dart';

class QuizController extends GetxController {
  List<Question> quiz;
  final int numOfQuestions;
  var time = 10.obs;
  RxBool toResultCalled = false.obs;
  late final StreamSubscription<int> sub;

  //static const Duration quizDuration = Duration(seconds: 10);

  // RxInt computationCount = 0.obs;
  //late StreamSubscription sub;

  @override
  void onReady() {
    super.onReady();
    startStream();
  }

  RxInt currentQuestionIndex = 0.obs;
  QuizController({
    required this.quiz,
    required this.numOfQuestions,
    //required this.time,
    // required this.computationCount,
    // required this.sub,
  });

  void nextQuestion() {
    if (currentQuestionIndex.value < numOfQuestions) {
      currentQuestionIndex++;
    } else {
      currentQuestionIndex.value = numOfQuestions;
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex--;
    } else {
      currentQuestionIndex.value = 0;
    }
  }

  void startStream() {
    //late final StreamSubscription<int> sub;
    final Stream<int> myStream = Stream.periodic(
      const Duration(seconds: 1),
      (int count) {
        time.value = 10 - count;
        return time.value;
      },
    );
    sub = myStream.listen(
      (event) {
        if (time.value == 0) {
          //time.value = 10;
          sub.cancel();
          toResultNavigation();
        }
      },
    );
  }

  void toResultNavigation() {
    print('value =========>${toResultCalled.value}');

    if (toResultCalled.value == false) {
      print('value =========>${toResultCalled.value}');

      toResultCalled.value = true;
      Get.offAll(
        () => Result(questions: quiz),
      );
    }
  }

  void toHomeNavigation() {
    Get.offAll(
      () => HomePage(),
    );
    sub.cancel();
  }
}
