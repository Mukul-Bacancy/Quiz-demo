import 'package:get/get.dart';
import 'package:quiz_demo/mock_data/mock_data.dart';
import 'package:quiz_demo/src/feature/quiz/views/quiz.dart';

class HomePageController extends GetxController {
  void startQuiz() {
    List<Question> quizQuestions = [];
    for (var q in questionList1) {
      quizQuestions.add(
        Question(
          question: q.question,
          answers: q.answers,
          correctAnswer_id: q.correctAnswer_id,
          q_id: q.q_id,
        ),
      );
    }
    //quizQuestions.addAll(questionList1);
    // quizQuestions = List.from(questionList1);
    Get.to(
            preventDuplicates: false,
            () => Quiz(
                  quizQuestions: quizQuestions,
                ))!
        .then((value) => () {
              Get.delete<HomePageController>();
            });
  }
}
