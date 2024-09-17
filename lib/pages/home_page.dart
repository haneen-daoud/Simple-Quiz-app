import 'package:flutter/material.dart';
import 'package:quiz_app/modules/quastion_with_answer.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/widgets/answer_widget_item.dart';
import 'package:quiz_app/widgets/congrats_widget.dart';
import 'package:quiz_app/widgets/main_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFinished = false;
  int quastionIndex = 0;
  int score = 0;
  String selectedAnswer = '';
  bool isclick = false;
  bool viewAnswer = false;

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: !isFinished ? Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      quastionWithAnswers[quastionIndex].quastion,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      textAlign: TextAlign.left,
                      'Answer and get points ',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '',
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Question ${quastionIndex + 1} ',
                              style:
                                  const TextStyle(color: AppColors.navyblue,decoration: TextDecoration.underline)),
                          TextSpan(
                              text: 'of ${quastionWithAnswers.length}',
                              style: const TextStyle(color: AppColors.grey)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color:Color.fromARGB(255, 232, 230, 230),width: 0.5),),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            children: quastionWithAnswers[quastionIndex]
                                .answers
                                .map((answer) => AnswerWidgetItem(
                                    answer: answer,
                                    selectedAnswer: selectedAnswer,
                                    onTap: () {
                                      setState(() {
                                        selectedAnswer = answer.text;
                                        isclick = true;
                                      });
                                    }))
                                .toList(),
                          ),
                        ),
                      ),
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.green,
                        disabledForegroundColor: Colors.grey.withOpacity(0.38),
                      ),
                      onPressed: isclick
                          ? () {
                              setState(() {
                                if (isclick) {
                                  viewAnswer = true;
                                } else {
                                  viewAnswer = false;
                                }
                              });
                            }
                          : null,
                      child: const Text('View Answer'),
                    ),
                    if (viewAnswer && isclick)
                      Text(quastionWithAnswers[quastionIndex].correctAnswer),
                    const Spacer(),
                    MainButton(
                        text: 'Next',
                        onTap: () {
                          setState(() {
                            if (selectedAnswer ==
                                quastionWithAnswers[quastionIndex]
                                    .correctAnswer) {
                              score++;
                            }

                            if (quastionIndex <
                                quastionWithAnswers.length - 1) {
                              if (isclick) {
                                quastionIndex++;
                                isclick = false;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'You should select an answer before proceeding to the next question.')),
                                );
                              }

                              viewAnswer = false;
                            } else {
                              if(isclick){
                              isFinished = true;
                              }
                              else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'You should select an answer before proceeding to the next question.')),
                                );

                              }
                            }
                          });
                        }),
                    const SizedBox(height: 8),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            quastionIndex = 0;
                            score = 0;
                            isFinished = false;
                            viewAnswer = false;
                            isclick = false;
                          });
                        },
                        child: const Text('Reset Quiz'))
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
