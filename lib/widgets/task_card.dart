import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/consts.dart';

class TaskCard extends StatelessWidget {
  final String? title;
  final String? desc;

  TaskCard({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),

      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "(Tarefa sem nome)",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: titleTextColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text( desc ??
              'Nenhuma descrição adicionada',
              style: TextStyle(
                fontSize: 16,
                color: bodyTextColor,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
