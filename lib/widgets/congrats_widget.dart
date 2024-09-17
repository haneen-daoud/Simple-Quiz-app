import 'package:flutter/material.dart';
import 'package:quiz_app/modules/quastion_with_answer.dart';
import 'package:quiz_app/utils/app_colors.dart';

class CongratsWidget extends StatelessWidget {
  final VoidCallback onTap;
  final int score;

  const CongratsWidget({super.key, required this.score, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with background color
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              decoration: const BoxDecoration(
                color: AppColors.navyblue,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              ),
              child: const Text(
                'Congratulations, Haneen!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Your score: $score/${quastionWithAnswers.length}',
              style: const TextStyle(
                color: AppColors.navyblue,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              ),
              child: const Text(
                'Reset Quiz',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
