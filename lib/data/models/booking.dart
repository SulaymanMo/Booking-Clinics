class Booking {
  final String docName,
      docAddress,
      docSpeciality,
      docImageUrl,
      date,
      time,
      bookingStatus;

  const Booking({
    required this.docName,
    required this.docAddress,
    required this.docSpeciality,
    required this.docImageUrl,
    required this.date,
    required this.time,
    required this.bookingStatus,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      docName: json['docName'],
      docAddress: json['docAddress'],
      docSpeciality: json['docSpeciality'],
      docImageUrl: json['docImageUrl'],
      date: json['date'],
      time: json['time'],
      bookingStatus: json['bookingStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docName': docName,
      'docAddress': docAddress,
      'docSpeciality': docSpeciality,
      'docImageUrl': docImageUrl,
      'date': date,
      'time': time,
      'bookingStatus': bookingStatus,
    };
  }
}