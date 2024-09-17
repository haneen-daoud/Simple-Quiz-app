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
    quastion: 'What is the capital city of Egypt?',
    answers: [
      Answer(text: 'Cairo', icon: Icons.location_city),
      Answer(text: 'Alexandria', icon: Icons.beach_access),
      Answer(text: 'Giza', icon: Icons.landscape),
      Answer(text: 'Luxor', icon: Icons.history),
    ],
    correctAnswer: 'Cairo',
  ),
  QuastionWithAnswer(
    quastion: 'Which city is the capital of Jordan?',
    answers: [
      Answer(text: 'Amman', icon: Icons.location_city),
      Answer(text: 'Aqaba', icon: Icons.sailing),
      Answer(text: 'Irbid', icon: Icons.agriculture),
      Answer(text: 'Zarqa', icon: Icons.factory),
    ],
    correctAnswer: 'Amman',
  ),
  QuastionWithAnswer(
    quastion: 'What is the capital of Morocco?',
    answers: [
      Answer(text: 'Rabat', icon: Icons.location_city),
      Answer(text: 'Casablanca', icon: Icons.beach_access),
      Answer(text: 'Marrakech', icon: Icons.book),
      Answer(text: 'Tangier', icon: Icons.sailing),
    ],
    correctAnswer: 'Rabat',
  ),
  QuastionWithAnswer(
    quastion: 'Which city is the capital of Iraq?',
    answers: [
      Answer(text: 'Baghdad', icon: Icons.location_city),
      Answer(text: 'Basra', icon: Icons.water),
      Answer(text: 'Mosul', icon: Icons.mosque),
      Answer(text: 'Najaf', icon: Icons.church),
    ],
    correctAnswer: 'Baghdad',
  ),
  QuastionWithAnswer(
    quastion: 'What is the capital of Lebanon?',
    answers: [
      Answer(text: 'Beirut', icon: Icons.location_city),
      Answer(text: 'Tripoli', icon: Icons.sailing),
      Answer(text: 'Sidon', icon: Icons.landscape),
      Answer(text: 'Zahle', icon: Icons.agriculture),
    ],
    correctAnswer: 'Beirut',
  ),
  QuastionWithAnswer(
    quastion: 'Which city is the capital of Tunisia?',
    answers: [
      Answer(text: 'Tunis', icon: Icons.location_city),
      Answer(text: 'Sfax', icon: Icons.star),
      Answer(text: 'Sousse', icon: Icons.beach_access),
      Answer(text: 'Kairouan', icon: Icons.history),
    ],
    correctAnswer: 'Tunis',
  ),
  QuastionWithAnswer(
    quastion: 'What is the capital of Saudi Arabia?',
    answers: [
      Answer(text: 'Riyadh', icon: Icons.location_city),
      Answer(text: 'Jeddah', icon: Icons.beach_access),
      Answer(text: 'Mecca', icon: Icons.mosque),
      Answer(text: 'Dammam', icon: Icons.inbox),
    ],
    correctAnswer: 'Riyadh',
  ),
  QuastionWithAnswer(
    quastion: 'Which city is the capital of Qatar?',
    answers: [
      Answer(text: 'Doha', icon: Icons.location_city),
      Answer(text: 'Al Wakrah', icon: Icons.sailing),
      Answer(text: 'Al Khor', icon: Icons.agriculture),
      Answer(text: 'Lusail', icon: Icons.business),
    ],
    correctAnswer: 'Doha',
  ),
  QuastionWithAnswer(
    quastion: 'What is the capital of Algeria?',
    answers: [
      Answer(text: 'Algiers', icon: Icons.location_city),
      Answer(text: 'Oran', icon: Icons.beach_access),
      Answer(text: 'Constantine', icon: Icons.mosque),
      Answer(text: 'Blida', icon: Icons.agriculture),
    ],
    correctAnswer: 'Algiers',
  ),
  QuastionWithAnswer(
    quastion: 'Which city is the capital of the United Arab Emirates (UAE)?',
    answers: [
      Answer(text: 'Abu Dhabi', icon: Icons.location_city),
      Answer(text: 'Dubai', icon: Icons.business),
      Answer(text: 'Sharjah', icon: Icons.museum),
      Answer(text: 'Ras Al Khaimah', icon: Icons.beach_access),
    ],
    correctAnswer: 'Abu Dhabi',
  ),
];
