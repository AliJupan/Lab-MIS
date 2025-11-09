import 'package:flutter/material.dart';
import 'package:lab1/widgets/exam_grid.dart';

import 'package:lab1/models/exam.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Exam> exam = List.generate(10, (index) {
    return Exam(
      id: index,
      name: "Испит ${index + 1}",
      date: DateTime(2025, 10, index + 28,7 + index),
      places: ["Лаб А", "Лаб Б", "Лаб Ц"],
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ExamGrid(exam: exam),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.all(16),
        child: Text(
          'Total exams: ${exam.length}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
