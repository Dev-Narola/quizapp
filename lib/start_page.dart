// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:quizapp/quizz_page.dart';
import 'package:quizapp/utils/bottom_button.dart';
import 'package:get/get.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/quizz.jpg'),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const QuizScreen());
                  },
                  child: const ButtonContainer(
                    text: "Start",
                    icon: Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                      weight: 50,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
