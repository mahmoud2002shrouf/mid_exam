class Task {
  String title;
  bool done;
  bool cancel;

  Task({required this.title, this.done = false, this.cancel = false});

  factory Task.fromJson(Map<String, dynamic> data) {
    return Task(
        title: data["title"], done: data["done"], cancel: data["cancel"]);
  }
}
