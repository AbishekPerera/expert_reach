class Times {
  String id;
  String time;

  Times({required this.id, required this.time});

  factory Times.fromJson(Map<String, dynamic> json) {
    return Times(id: json['times_id'] ?? "", time: json['times_time'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {'times_id': id, 'times_time': time};
  }
}
