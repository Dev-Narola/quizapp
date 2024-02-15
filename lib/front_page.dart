// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/quizz_page.dart';
import 'package:quizapp/start_page.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> quizTitles = [
      ["Trivia Mastermind", "Brain Teaser Challenge"],
      ["Brain Teaser Challenge", "Trivia Mastermind"],
      ["Quiz Quest:", "Test Your Knowledge"],
      ["Mind Bender Madness", "Brain Teaser Challenge"],
      ["Quizathon:", "The Ultimate Challenge"],
      ["Genius Genie:", "Trivia Edition"],
      ["Quiz Whiz:", "Brain Workout"],
      ["Trivia Titan:", "Test Your IQ"],
      ["Quiz Wizard:", "Master of Knowledge"],
      ["Brainiac Bonanza:", "Ultimate Quiz Show"]
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz List"),
        backgroundColor: Colors.blue.shade100,
      ),
      body: ListView.builder(
        itemCount: quizTitles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => const QuizScreen());
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 4),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 25,
                          child: Text(
                            "➡️  ${quizTitles[index][0]}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          height: 22,
                          child: Text(
                            "     ${quizTitles[index][1]}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 20,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Status : Pending",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Icon(Icons.access_time, size: 15)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.arrow_forward),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
