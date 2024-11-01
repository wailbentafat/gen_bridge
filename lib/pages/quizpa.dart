import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final String title;

  const QuizPage({Key? key, required this.title}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What year did the Algerian War of Independence start?',
      'options': ['1954', '1962', '1945', '1960'],
      'answer': '1954',
    },
    {
      'question': 'Who was the first President of Algeria?',
      'options': ['Ahmed Ben Bella', 'Houari Boumediène', 'Abdelaziz Bouteflika', 'Ferhat Abbas'],
      'answer': 'Ahmed Ben Bella',
    },
  ];

  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];

  void submitAnswer(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    final correctAnswers = questions.where((q) => q['answer'] == selectedAnswers[questions.indexOf(q)]).length;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Quiz Results'),
          content: Text('You answered $correctAnswers out of ${questions.length} questions correctly.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); 
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 137, 117),
        title: Text(
          'Quiz: ${widget.title}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 33, 48, 43),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question Text
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 76, 137, 117),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                question['question'],
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            // Answer Options
            Expanded(
              child: ListView(
                children: question['options'].map<Widget>((option) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () => submitAnswer(option),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 76, 137, 117),
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(option),
                    ),
                  );
                }).toList(),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Question ${currentQuestionIndex + 1} of ${questions.length}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
