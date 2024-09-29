class Booking {
  String id,
      date,
      time,
      docName,
      address,
      imageUrl,
      specialty,
      patientName,
      bookingStatus;

  Booking({
    required this.id,
    required this.date,
    required this.time,
    required this.docName,
    required this.address,
    required this.imageUrl,
    required this.specialty,
    required this.patientName,
    required this.bookingStatus,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      date: json['date'],
      time: json['time'],
      docName: json['doc_name'],
      address: json['address'],
      imageUrl: json['image_url'],
      specialty: json['specialty'],
      patientName: json["patient_name"],
      bookingStatus: json["booking_status"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'time': time,
      'doc_name': docName,
      'address': address,
      'image_url': imageUrl,
      'specialty': specialty,
      'patient_name': patientName,
      'booking_status': bookingStatus,
    };
  }
}
