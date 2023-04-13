import 'dart:ffi';

import 'package:flutter/rendering.dart';
import 'package:quizeller/question.dart';

class QuizBrain {
  List<Question> _questionBank = [
    Question(
        title: "You can lead a cow down stairs but not up stairs.", ans: true),
    Question(
        title: "Approximately one quarter of human bones are in the feet",
        ans: false),
    Question(title: "A slug\' blood is green.", ans: true),
  ];
  int currentIndex = 0;

  void nextQuestion() {
    print("nextQuestion:$currentIndex");
    if (currentIndex < _questionBank.length) {
      currentIndex++;
    }
  }

  String getQuestionText() {
    print("getQuestionText:$currentIndex");
    if (currentIndex < _questionBank.length) {
      return _questionBank[currentIndex].title;
    } else {
      return _questionBank[_questionBank.length - 1].title;
    }
  }

  bool? checkResponse(bool wasCorrect) {
    print("checkResponse:$currentIndex");
    if (currentIndex >= _questionBank.length) {
      return null;
    }
    return wasCorrect == _questionBank[currentIndex].answer;
  }
}
