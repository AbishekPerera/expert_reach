class AvailableTime {
  String id;
  String time;
  String status;

  AvailableTime({
    required this.id,
    required this.time,
    required this.status,
  });

  factory AvailableTime.fromJson(Map<String, dynamic> json) => AvailableTime(
        id: json["id"],
        time: json["time"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "status": status,
      };
}
