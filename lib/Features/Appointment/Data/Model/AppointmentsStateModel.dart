class AppointmentsStateModel{
  dynamic appointmentsId;
  dynamic day;
  dynamic time;
  dynamic status;
  AppointmentsStateModel({
    required this.appointmentsId,
    required this.day,
    required this.time,
    required this.status,
  });
  factory AppointmentsStateModel.fromJson( dynamic jsonData){
    return AppointmentsStateModel(
      appointmentsId:jsonData["appointment_id"],
      day:jsonData["the_day"] ,
      time: jsonData["the_time"],
      status: jsonData["status"],
    );
  }
}