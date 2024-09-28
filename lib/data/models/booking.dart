class Booking {
  String docName,
      docAddress,
      doctorId,
      docSpeciality,
      docImageUrl,
      date,
      time,
      bookingStatus,
      patientName;

  Booking({
    required this.docName,
    required this.docAddress,
    required this.docSpeciality,
    required this.docImageUrl,
    required this.date,
    required this.time,
    required this.doctorId,
    required this.bookingStatus,
    required this.patientName,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      docName: json['docName'],
      doctorId: json['doctorId'],
      docAddress: json['docAddress'],
      docSpeciality: json['docSpeciality'],
      docImageUrl: json['docImageUrl'],
      date: json['date'],
      time: json['time'],
      bookingStatus: json['bookingStatus'],
      patientName: json['patientName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docName': docName,
      'doctorId': doctorId,
      'docAddress': docAddress,
      'docSpeciality': docSpeciality,
      'docImageUrl': docImageUrl,
      'date': date,
      'time': time,
      'bookingStatus': bookingStatus,
      'patientName': patientName,
    };
  }
}
