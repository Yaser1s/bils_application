//
//
//
//
//
//
//
//
//
//
//
//
//
//

//

//

//

class AdedBillDelars {
  final String uidDriver;
  final String uidBill;
  final String nameFarmar;
  final String numberDriver;
  final String uidFarmar;
  final String typeDate;
  final String typePuy;
  final double counts;
  final double price;
  final double allPrice;
  final String nameDelars;
  final String uidTrador;
  final String uidDelar;
  AdedBillDelars({
    required this.uidDriver,
    required this.uidBill,
    required this.numberDriver,
    required this.nameFarmar,
    required this.uidFarmar,
    required this.typeDate,
    required this.typePuy,
    required this.counts,
    required this.price,
    required this.allPrice,
    required this.nameDelars,
    required this.uidTrador,
    required this.uidDelar,
  });
  Map<String, dynamic> convert2Map() {
    return {
      "UidDriver": uidDriver,
      "UidBill": uidBill,
      "NumberDriver": numberDriver,
      "NameFarmar": nameFarmar,
      "DateTime": DateTime.now(),
      "TypeDate": typeDate,
      "TypePuy": typePuy,
      "Counts": counts,
      "Price": price,
      "AllPrice": allPrice,
      "NameDelars": nameDelars,
      "Cach": 0.0,
      "UidTrador": uidTrador,
      "UidDelar": uidDelar,
    };
  }
}
