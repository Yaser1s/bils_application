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

class AdedBill {
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
  final String numberCachMachen;
  final double cach;
  final String uidTrador;
  AdedBill(
      {required this.uidDriver,
      required this.uidBill,
      required this.numberDriver,
      required this.nameFarmar,
      required this.uidFarmar,
      required this.typeDate,
      required this.typePuy,
      required this.counts,
      required this.price,
      required this.allPrice,
      required this.numberCachMachen,
      required this.cach,
      required this.uidTrador});
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
      "NumberCachMachen": numberCachMachen,
      "Cach": cach,
      "uidTrador": uidTrador,
    };
  }
}
