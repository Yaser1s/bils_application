class AddFarm {
  final dynamic uidFarm;
  final DateTime dateUpload;
  final String whowInCharge;
  final String whowInChargePhoneNumber;
  final String whowUplodetUid;

  AddFarm({
    required this.uidFarm,
    required this.dateUpload,
    required this.whowInCharge,
    required this.whowInChargePhoneNumber,
    required this.whowUplodetUid,
  });
  Map<String, dynamic> convert2Map() {
    return {
      "UidFarm": uidFarm,
      "WhowInCharge": whowInCharge,
      "WhowInChargePhoneNumber": whowInChargePhoneNumber,
      "WhowUplodetUid": whowUplodetUid,
      "Drivers": [],
    };
  }
}

class AddNewDriver {
  final String uidFarm;
  final String uidDriver;
  final String nameFarmar;
  final DateTime dateUpload;
  final String driverName;
  final String driverNumber;
  final String driverPhoneNumber;
  final String whowUplodetUid;

  AddNewDriver({
    required this.uidFarm,
    required this.uidDriver,
    required this.nameFarmar,
    required this.dateUpload,
    required this.driverName,
    required this.driverNumber,
    required this.driverPhoneNumber,
    required this.whowUplodetUid,
  });
  Map<String, dynamic> convert2Map() {
    return {
      "UidDriver": uidDriver,
      "UidFarm": uidFarm,
      "NameFarmar": nameFarmar,
      "DateUpload": dateUpload,
      "WhowUplodetUid": whowUplodetUid,
      "DriverName": driverName,
      "DriverNumber": driverNumber,
      "DriverPhoneNumber": driverPhoneNumber,
      "Bills": [],
      "Cach": 0.0,
    };
  }
}
