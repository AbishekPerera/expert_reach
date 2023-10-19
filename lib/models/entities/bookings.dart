class Bookings {
  String id;
  String customer_id;
  String service_provider_id;
  String service_id;
  String date;
  String time_from;
  String notes;
  String status;
  String created_at;
  String updated_at;

  Bookings({
    required this.id,
    required this.customer_id,
    required this.service_provider_id,
    required this.service_id,
    required this.date,
    required this.time_from,
    required this.notes,
    required this.status,
    required this.created_at,
    required this.updated_at,
  });

  factory Bookings.fromJson(Map<String, dynamic> json) {
    return Bookings(
      id: json['bookings_id'] ?? '',
      customer_id: json['bookings_customer_id'] ?? '',
      service_provider_id: json['bookings_service_provider_id'] ?? '',
      service_id: json['bookings_service_id'] ?? '',
      date: json['bookings_date'] ?? '',
      time_from: json['bookings_time_from'] ?? '',
      notes: json['bookings_notes'] ?? '',
      status: json['bookings_status'] ?? '',
      created_at: json['bookings_created_at'] ?? '',
      updated_at: json['bookings_updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customer_id,
        'service_provider_id': service_provider_id,
        'service_id': service_id,
        'date': date,
        'time_from': time_from,
        'notes': notes,
        'status': status,
        'created_at': created_at,
        'updated_at': updated_at,
      };
}
