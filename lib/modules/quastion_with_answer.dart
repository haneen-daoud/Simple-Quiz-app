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
