import 'dart:convert';

List<ToDoModel> toDoModelFromJson(String str) =>
    List<ToDoModel>.from(json.decode(str).map((x) => ToDoModel.fromJson(x)));

String toDoModelToJson(List<ToDoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDoModel {
  ToDoModel({
    required this.id,
    required this.title,
    required this.userId,
    required this.details,
    required this.type,
    required this.deadlineDate,
    required this.deadlineTime,
    required this.notificationStatus,
    required this.completedStatus,
    required this.isDeadlineOver,
  });

  int id;
  String title;
  String userId;
  String details;
  String type;
  DateTime deadlineDate;
  DateTime deadlineTime;
  bool notificationStatus;
  bool completedStatus;
  bool isDeadlineOver;

  factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        id: json["id"],
        title: json["title"],
        userId: json["userId"],
        details: json["details"],
        type: json["type"],
        deadlineDate: DateTime.parse(json["deadlineDate"]),
        deadlineTime: DateTime.parse(json["deadlineTime"]),
        notificationStatus: json["notifictionStatus"],
        completedStatus: json["completedStatus"],
        isDeadlineOver: json["isDeadlineOver"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "userId": userId,
        "details": details,
        "type": type,
        "deadlineDate": deadlineDate.toIso8601String(),
        "deadlineTime": deadlineTime.toIso8601String(),
        "notifictionStatus": notificationStatus,
        "completedStatus": completedStatus,
        "isDeadlineOver": isDeadlineOver,
      };
}
