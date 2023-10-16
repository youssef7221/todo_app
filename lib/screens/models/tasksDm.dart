class TasksDm {
  String title;
  String description;
  String id;
  int date;
  bool isDone;
  TasksDm(
      {required this.title,
      required this.description,
      required this.date,
      this.id = "",
      this.isDone = false});

  TasksDm.fromjson(Map<String , dynamic> json) : this (
    date: json['date'],
    id: json['id'],
    title: json['title'],
    description: json['description'],
    isDone: json['isDone'],
  );
  Map<String , dynamic>tojson(){
    return {
      'title' : title ,
      'description' : description,
      'date' : date,
      'id' : id,
      'isDone' : isDone
    };
}
}
