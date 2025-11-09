import 'package:flutter/material.dart';

import '../models/exam.dart';


class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: exam);
      },

      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: exam.date.isBefore(DateTime.now())
                ? Colors.red
                : Colors.green,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(exam.name, style: TextStyle(fontSize: 20)),
              Divider(),
              Row(
                children: [
                  Icon(Icons.calendar_today,size: 12,),
                  Text(
                    '${exam.date.day}/${exam.date.month}/${exam.date.year} : ${exam.date.hour}:${exam.date.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Row(children: [
                Icon(Icons.location_on_outlined,size: 12,),
                Text(exam.places.join(", "), style: TextStyle(fontSize: 12)),
              ],)

            ],
          ),
        ),
      ),
    );
  }
}
