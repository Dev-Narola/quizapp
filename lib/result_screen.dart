import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/front_page.dart';
import 'package:quizapp/utils/bottom_button.dart';
import 'package:quizapp/utils/common_text.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  final int totalMarks;

  const ResultScreen({Key? key, required this.totalMarks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    List<List<dynamic>> persons = [
      [1, 'John Doe', 8],
      [2, 'Jane Smith', 7],
      [3, 'Michael Johnson', 9],
      [4, 'Emily Davis', 6],
      [5, 'David Brown', 7],
      [6, 'Sarah Wilson', 8],
      [7, 'Matthew Taylor', 8],
      [8, 'Olivia Martinez', 9],
      [9, 'James Anderson', 7],
      [10, 'Emma Garcia', 8],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Quiz Result")),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 147, 147, 147),
                  blurRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Lottie.asset(
                  "assets/lottie/Crackers1.json",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  repeat: false,
                ),
                Lottie.asset(
                  "assets/lottie/Crackers1.json",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  repeat: true,
                ),
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height / 50),
                        child: Image.asset(
                          "assets/trophy.png",
                          height: height / 6,
                          width: width / 4,
                        ),
                      ),
                      SizedBox(height: height / 80),
                      Center(
                        child: Common(
                          text: totalMarks > 5
                              ? "Congratulations, You Got : "
                              : "Need to learn, You Got: ",
                          weight: FontWeight.w500,
                          size: height / 32,
                          color: totalMarks > 5
                              ? Colors.green
                              : Colors.red.shade400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Common(
                        text: "$totalMarks / 10",
                        weight: FontWeight.w500,
                        size: height / 32,
                        color:
                            totalMarks > 5 ? Colors.green : Colors.red.shade400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: Common(
                        text: persons[index][0].toString(),
                        weight: FontWeight.w500,
                        size: 18,
                        color: Colors.blue.shade50,
                      ),
                      title: Common(
                        text: persons[index][1].toString(),
                        weight: FontWeight.w500,
                        size: 18,
                        color: Colors.blue.shade50,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Common(
                            text: "${persons[index][2].toString()} x ",
                            weight: FontWeight.w500,
                            size: 18,
                            color: Colors.blue.shade50,
                          ),
                          Image.asset("assets/rose.png")
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const FrontPage());
              },
              child: const ButtonContainer(
                text: "Back to Quiz Page",
                width: 250,
                size: 21,
                icon: Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                  weight: 50,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
