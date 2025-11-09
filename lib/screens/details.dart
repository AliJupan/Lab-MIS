import 'package:flutter/material.dart';

import '../models/exam.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  formattedDate(exam) {
    return '${exam.date.day.toString().padLeft(2, '0')}/'
        '${exam.date.month.toString().padLeft(2, '0')}/'
        '${exam.date.year} : ${exam.date.hour}:${exam.date.minute.toString().padLeft(2,'0')}';
  }


  String getTimeRemaining(DateTime examDate) {
    final now = DateTime.now();
    final differenceInDays = examDate.difference(now);

    if (differenceInDays.isNegative) {
      return "Испитот поминал";
    }

    final days = differenceInDays.inDays;
    final hours = differenceInDays.inHours % 24;

    return "$days days, $hours hours";
  }

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;
    return Scaffold(
      appBar: AppBar(title: Text(exam.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text('${exam.date.day}/${exam.date.month}/${exam.date.year} : ${exam.date.hour}:${exam.date.minute.toString().padLeft(2,'0')}'),
                const SizedBox(width: 16),
                const SizedBox(width: 4),
                const SizedBox(width: 16),
                const Icon(Icons.timer, size: 16),
                const SizedBox(width: 4),
                Text(getTimeRemaining(exam.date)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    exam.places.join(", "),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
