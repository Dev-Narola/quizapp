import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int totalMarks;

  const ResultScreen({Key? key, required this.totalMarks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Result"),
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
            child: Center(
              child: Text(
                "Total Marks: $totalMarks",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.cyan,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
