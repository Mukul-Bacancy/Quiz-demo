// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class Question {
  final String question;
  final List<Answer> answers;
  final num correctAnswer_id;
  final num q_id;
  num? selectedAnswer_id;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer_id,
    required this.q_id,
    this.selectedAnswer_id,
  });
}
class Answer {
  final String answer;
  final num a_id;
  bool isSelected = false;
  Answer({
    required this.answer,
    required this.a_id,
  });
}

List<Question> questionList1 = [
  Question(
    question: 'what is the capital of Gujarat',
    answers: [
      Answer(answer: 'Surat', a_id: 1),
      Answer(answer: 'Ahmedabad', a_id: 2),
      Answer(answer: 'Gandhinagar', a_id: 3),
      Answer(answer: 'Vadodara', a_id: 4),
    ],
    correctAnswer_id: 3,
    q_id: 1,
  ),
  Question(
    question: 'who is COAS',
    answers: [
      Answer(answer: 'General Manoj Pande', a_id: 1),
      Answer(answer: 'Gen B P rawat', a_id: 2),
      Answer(answer: 'Karanbir singh Lanba', a_id: 3),
      Answer(answer: 'Sam Maneckshaw', a_id: 4),
    ],
    correctAnswer_id: 1,
    q_id: 2,
  ),
  Question(
    question: 'what was the captial of India under british rule',
    answers: [
      Answer(answer: 'Surat', a_id: 1),
      Answer(answer: 'Kolkata', a_id: 2),
      Answer(answer: 'Hyderabad', a_id: 3),
      Answer(answer: 'Delhi', a_id: 4),
    ],
    correctAnswer_id: 2,
    q_id: 3,
  ),
  Question(
    question: 'what is the full form ITUS',
    answers: [
      Answer(answer: 'Indian tourisn and underlying sciences', a_id: 1),
      Answer(answer: 'Interantional territorial undisputed schemes', a_id: 2),
      Answer(answer: 'Iski topi  uske sir', a_id: 3),
      Answer(answer: 'Inter technical ubiquity  system', a_id: 4),
    ],
    correctAnswer_id: 3,
    q_id: 4,
  ),
  Question(
    question: 'who is Babu bhaiya',
    answers: [
      Answer(answer: 'Akshay kumar', a_id: 1),
      Answer(answer: 'Paresh Rawal', a_id: 2),
      Answer(answer: 'You', a_id: 3),
      Answer(answer: 'Amit Shah', a_id: 4),
    ],
    correctAnswer_id: 2,
    q_id: 5,
  ),
];
