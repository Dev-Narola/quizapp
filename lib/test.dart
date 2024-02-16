import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Tests extends StatelessWidget {
  final int totalMarks;

  const Tests({Key? key, required this.totalMarks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Result"),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 239, 239, 239),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 147, 147, 147),
                  blurRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Stack(children: [
              Lottie.asset(
                "assets/lottie/Crackers1.json",
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
                repeat: false,
              ),
              Lottie.asset(
                "assets/lottie/Crackers1.json",
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
                repeat: false,
              ),
              Center(
                child: Text(
                  "Total Marks: $totalMarks",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.cyan,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
