import 'package:flutter/material.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/utils/bottom_button.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  final List<List<String>> _options = [
    [
      "jai swami narayan my name is dev",
      "Option 1Awfbwkehefbjkhjwebrfwkehfbdiweyvbfwehfbewhyvbfhjwevbrfhdbfsdfkjdsgfkdsbfkhdsbfskdubfsdhvfakuaskgfvkedsua",
      "Option 1B",
      "Option 1C",
      "Option 1D"
    ],
    ["Question: 2", "Option 2A", "Option 2B", "Option 2C", "Option 2D"],
    ["Question: 3", "Option 3A", "Option 3B", "Option 3C", "Option 3D"],
    ["Question: 4", "Option 4A", "Option 4B", "Option 4C", "Option 4D"],
    ["Question: 5", "Option 5A", "Option 5B", "Option 5C", "Option 5D"],
    ["Question: 6", "Option 6A", "Option 6B", "Option 6C", "Option 6D"],
    ["Question: 7", "Option 7A", "Option 7B", "Option 7C", "Option 7D"],
    ["Question: 8", "Option 8A", "Option 8B", "Option 8C", "Option 8D"],
    ["Question: 9", "Option 9A", "Option 9B", "Option 9C", "Option 9D"],
    ["Question: 10", "Option 10A", "Option 10B", "Option 10C", "Option 10D"],
  ];
  final List<int> _selectedOptions = List.filled(10, -1);
  final List<int> _correctAnswers = [0, 1, 2, 3, 0, 1, 2, 3, 0, 1];
  int _totalMarks = 0;

  void _selectOption(int index, int optionIndex) {
    setState(() {
      _selectedOptions[index] = optionIndex;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < 9) {
        _currentQuestionIndex++;
      } else {
        _calculateMarks();
        Get.to(() => ResultScreen(
              totalMarks: _totalMarks,
            ));
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
      }
    });
  }

  void _calculateMarks() {
    int marks = 0;
    for (int i = 0; i < _correctAnswers.length; i++) {
      if (_selectedOptions[i] == _correctAnswers[i]) {
        marks++;
      }
    }
    setState(() {
      _totalMarks = marks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text("Question ${_currentQuestionIndex + 1}/10"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Progress",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: LinearProgressIndicator(
              minHeight: 15,
              borderRadius: BorderRadius.circular(25),
              value: (_currentQuestionIndex + 1) / 10,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  Colors.blue.shade100,
                  Colors.blue.shade100,
                  Colors.blue.shade200,
                ]),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  _options[_currentQuestionIndex][0],
                  style: const TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _selectOption(_currentQuestionIndex, index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    height: MediaQuery.of(context).size.height / 11,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: _selectedOptions[_currentQuestionIndex] == index
                          ? Colors.blue.shade200
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        _options[_currentQuestionIndex][index + 1],
                        style: TextStyle(
                          color:
                              _selectedOptions[_currentQuestionIndex] == index
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _previousQuestion();
                  },
                  child: Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.arrow_back),
                        Text(
                          "Previous",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _nextQuestion();
                  },
                  child: ButtonContainer(
                    text:
                        _currentQuestionIndex < 9 ? "Next Question" : "Finish",
                    icon: const Icon(Icons.arrow_forward),
                    width: 160,
                    size: 17,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
