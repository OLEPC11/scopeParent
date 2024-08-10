class AppointmentsModel{
  dynamic appointmentsId;
  dynamic day;
  dynamic time;
  AppointmentsModel({
    required this.appointmentsId,
    required this.day,
    required this.time,
  });
  factory AppointmentsModel.fromJson( dynamic jsonData){
    return AppointmentsModel(
      appointmentsId:jsonData["id"],
      day:jsonData["the_day"] ,
      time: jsonData["the_time"],
    );
  }
}