import 'package:flutter/material.dart';
import 'package:quiz_app/modules/quastion_with_answer.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/widgets/answer_widget_item.dart';
import 'package:quiz_app/widgets/congrats_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int quastionIndex = 0;
  bool isFinished = false;
  int score = 0;
  String selectedAnswer = '';

  //we made a widget to reduce the duplication in code and enhance performance haneen
  Widget answerButton({required String text, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 25,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: !isFinished
              ? Column(
                  children: [
                    
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        quastionWithAnswers[quastionIndex].quastion,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'answer and get point ',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        children: quastionWithAnswers[quastionIndex]
                            .answers
                            .map((answer) => AnswerWidgetItem(
                                answer: answer,
                                selectedAnswer: selectedAnswer,
                                onTap: () {
                                  setState(() {
                                    selectedAnswer = answer.text;
                                  });
                                }))
                            .toList(),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (selectedAnswer ==
                                  quastionWithAnswers[quastionIndex]
                                      .correctAnswer) {
                                score++;
                              }

                              if (quastionIndex <
                                  quastionWithAnswers.length - 1) {
                                quastionIndex++;
                              } else {
                                isFinished = true;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.black,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text('Next'),
                        ),
                      ),
                    
                    const SizedBox(height: 8),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            quastionIndex = 0;
                            score = 0;
                            isFinished = false;
                          });
                        },
                        child: const Text('reset Quiz'))
                  ],
                )
              : CongratsWidget(
                  score: score,
                  onTap: () {
                    setState(() {
                      quastionIndex = 0;
                      score = 0;
                      isFinished = false;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
