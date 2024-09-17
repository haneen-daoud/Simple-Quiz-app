import 'package:flutter/material.dart';
import 'package:quiz_app/modules/quastion_with_answer.dart';
import 'package:quiz_app/utils/app_colors.dart';
class CongratsWidget extends StatelessWidget {
  final VoidCallback onTap;
  final int score;

  const CongratsWidget({super.key , required this.score ,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
                    children: [
                      const Text(
                        'Congratulations  haneen ',
                        style: TextStyle(
                          color:AppColors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('your score $score/${quastionWithAnswers.length}'),
                       const SizedBox(height: 8),
                      TextButton(
                          onPressed: onTap,
                          child: const Text('reset Quiz'))
                    ],
                  ),
    );
    
    
  }
}