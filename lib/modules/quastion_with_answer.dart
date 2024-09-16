// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QuastionWithAnswer {
  final String quastion;
  final List<Answer>answers;
  final String correctAnswer;

  QuastionWithAnswer(
    {
      required this.quastion,
      required this.answers,
      required this.correctAnswer});

}
class Answer {
  final String text;
  final IconData  icon ;

  Answer({
    required this.text,
    required this.icon,
  });

}
    List<QuastionWithAnswer> quastionWithAnswers = [
      QuastionWithAnswer(
        quastion: 'Quastion1: what is your favourite color ?',
        answers: [
          Answer(
            text: 'red',
            icon: Icons.circle,
          ),
          Answer(text: 'blue', icon: Icons.star),
          Answer(text: 'green', icon: Icons.phone),
          Answer(text: 'yellow', icon: Icons.add)
        ],
        correctAnswer: 'red',
      ),
      QuastionWithAnswer(
        quastion: 'Quastion2: what is your name ?',
        answers: [
          Answer(text: 'haneen', icon: Icons.add),
          Answer(text: 'sara', icon: Icons.star),
          Answer(text: 'dana', icon: Icons.star),
          Answer(text: 'yara', icon: Icons.add),
        ],
        correctAnswer: 'sara',
      ),
      QuastionWithAnswer(
        quastion: 'Quastion3: where are you from ?',
        answers: [
          Answer(text: 'hebron', icon: Icons.add),
          Answer(text: 'jenin', icon: Icons.star),
          Answer(text: 'Gaza', icon: Icons.star),
          Answer(text: 'qalqilia', icon: Icons.add),
        ],
        correctAnswer: 'hebron',
      ),
    ];