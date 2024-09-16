import 'package:flutter/material.dart';
import 'package:quiz_app/modules/quastion_with_answer.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/widgets/answer_widget_item.dart';

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
    List<QuastionWithAnswer> quastionWithAnswers = [
      QuastionWithAnswer(
        quastion: 'Quastion1: what is your favourite color ?',
        answers:
         [
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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: Column(
            children: [
              if (!isFinished) ...[
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
                      .map(
                        (answer) =>AnswerWidgetItem(
                        answer:answer,
                        selectedAnswer:selectedAnswer ,
                        onTap: (){
                          setState(() {
                            selectedAnswer=answer.text;
                          });
                        }
                        
                        
                        
                        )
                         /*Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child:InkWell(
                            onTap: (){
                              setState(() {
                                selectedAnswer=answer.text;

                              });
  
                            },

                          
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedAnswer==answer.text? AppColors.green:AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(answer.icon,
                                  color: selectedAnswer==answer.text ? AppColors.white:AppColors.black,

                                  
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    answer.text,
                                    style: TextStyle(
                                      color: selectedAnswer==answer.text ? AppColors.white:AppColors.black,
                                    ),),
                                ],
                              ),
                            ),
                          ),
                          ),
                        ),
*/
                        /*
                        (answer) => answerButton(
                          text: answer,
                          onPressed: () {
                            setState(() {
                              if (answer ==
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
                        ),
                        */
                    
                      )
                      .toList(),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(

                  onPressed: (){
                    setState(() {
                      if(selectedAnswer == quastionWithAnswers[quastionIndex].correctAnswer ){
                        score++;
                      }


                      if(quastionIndex< quastionWithAnswers.length-1){
                        quastionIndex++;
                      }
                      else
                      {
                        isFinished=true;
                      }
                    });
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12) ),

                  ),
                  child:const Text('Next'),
                ),
                ),
              ],
              if (isFinished) ...[
                const Text(
                  'Congratulations  haneen ',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text('your score $score/${quastionWithAnswers.length}'),
              ],
              const SizedBox(height: 8),
              TextButton(
                  onPressed: () {
                    setState(() {
                      quastionIndex = 0;
                      score = 0;
                      isFinished = false;
                    });
                  },
                  child: const Text('rese t Quiz'))

              /* answerButton(text :'red',onPressed: _debugSucces),

            answerButton(text: 'blue', onPressed: _debugSucces),

            answerButton(text: 'green', onPressed: _debugSucces),*/
            ],
          
          ),
        ),
      ),
    );
  }
}
