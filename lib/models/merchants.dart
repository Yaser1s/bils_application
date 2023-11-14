class AddNewMerchants {
  final String typeDelar;
  final String uidMerchants;
  final DateTime dateUpload;
  final String numberPhone;
  final String name;
  final double howMuchOweHim;
  final String whowUplodetUid;

  AddNewMerchants(
      {required this.typeDelar,
      required this.uidMerchants,
      required this.dateUpload,
      required this.numberPhone,
      required this.name,
      required this.howMuchOweHim,
      required this.whowUplodetUid});
  Map<String, dynamic> convert2Map() {
    return {
      "DateUpload": dateUpload,
      "WhowUplodetUid": whowUplodetUid,
      "TypeDelar": typeDelar,
      "UidMerchants": uidMerchants,
      "NumberPhone": numberPhone,
      "Name": name,
      "HowMuchOweHim": howMuchOweHim,
      "HowMuchHeOweUs": 0.0,
      "Bills": []
    };
  }
}
