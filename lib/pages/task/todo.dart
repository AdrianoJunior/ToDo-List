class Todo {
  int? id;
  int? taskId;
  String? title;
  int? isDone;
  Todo({this.id, this.taskId, this.title, this.isDone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskId': taskId,
      'title': title,
      'isDone': isDone,
    };
  }
}