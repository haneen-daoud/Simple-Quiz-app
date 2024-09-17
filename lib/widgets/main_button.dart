import 'package:flutter/material.dart';
import 'package:quiz_app/utils/app_colors.dart';
class MainButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const MainButton({super.key,required this.onTap ,required this.text});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.black,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child:  Text(text),
                        ),
                      );
  }
}