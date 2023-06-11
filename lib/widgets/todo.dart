import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/consts.dart';

class ToDo extends StatelessWidget {
  final bool? complete;
  final String? title;

  ToDo({this.complete = false, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: complete! ? homeFABColor : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: complete!
                  ? null
                  : Border.all(
                      color: const Color(0xff86829D),
                    ),
            ),
            child: complete!
                ? const Image(
                    image: AssetImage('assets/images/check_icon.png'),
                  )
                : const Center(),
          ),
          Text(
            title ?? "Tarefa sem nome",
            style: TextStyle(
              fontSize: 16,
              color: complete! ? titleTextColor : notCompletedColor,
              fontWeight: complete! ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
