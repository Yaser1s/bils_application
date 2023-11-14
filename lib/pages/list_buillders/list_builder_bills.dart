import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListBuilderBills extends StatefulWidget {
  const ListBuilderBills({super.key});

  @override
  State<ListBuilderBills> createState() => _ListBuilderBillsState();
}

class _ListBuilderBillsState extends State<ListBuilderBills> {

  
      final credential = FirebaseAuth.instance;

      
  @override
  Widget build(BuildContext context) {
     return 
    //allBills.isEmpty ?
                 const SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Center(
                        child: Text("لم يتم انشاء اي فاتورة حتى الان",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold))))
                // : ListView.builder(
                //     itemCount: allBills.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Card(
                //           color: Color.fromARGB(34, 107, 40, 6),
                //           child: Column(
                //             children: [
                //               Container(
                //                 height: 30,
                //                 padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                //                 child: Row(
                //                   children: [
                //                     Expanded(
                //                       flex: 3,
                //                       child: Text(
                //                         allBills[index].NumberOfName,
                //                         style: TextStyle(fontSize: 10),
                //                       ),
                //                     ),
                //                     Expanded(
                //                       flex: 2,
                //                       child: SizedBox(
                //                         height: 10,
                //                       ),
                //                     ),
                //                     Expanded(
                //                       flex: 6,
                //                       child: Text(allBills[index].Name,
                //                           style: TextStyle(fontSize: 15)),
                //                     ),
                //                     Expanded(
                //                       flex: 3,
                //                       child: SizedBox(
                //                         height: 10,
                //                       ),
                //                     ),
                //                     Expanded(
                //                         flex: 2,
                //                         child: Container(
                //                             alignment: Alignment.centerRight,
                //                             child: Text(allBills[index].Time)))
                //                   ],
                //                 ),
                //               ),
                //               Container(
                //                 height: 28,
                //                 padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                //                 child: Row(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Expanded(
                //                       flex: 3,
                //                       child: Text(
                //                           "السعر : ${allBills[index].Price}",
                //                           style: TextStyle(fontSize: 13)),
                //                     ),
                //                     Expanded(
                //                       flex: 1,
                //                       child: SizedBox(
                //                         height: 10,
                //                       ),
                //                     ),
                //                     Expanded(
                //                       flex: 3,
                //                       child: Container(
                //                         alignment: Alignment.center,
                //                         child: Text(
                //                             "العدد : ${allBills[index].Count}",
                //                             style: TextStyle(fontSize: 15)),
                //                       ),
                //                     ),
                //                     Expanded(
                //                       flex: 1,
                //                       child: SizedBox(
                //                         height: 10,
                //                       ),
                //                     ),
                //                     Expanded(
                //                         flex: 4,
                //                         child: Container(
                //                             alignment: Alignment.centerRight,
                //                             child: Text(
                //                                 "نوع التمر : ${allBills[index].Type}")))
                //                   ],
                //                 ),
                //               ),
                //               Container(
                //                 height: 40,
                //                 padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                //                 child: Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Expanded(
                //                       flex: 6,
                //                       child: Container(
                //                         alignment: Alignment.centerRight,
                //                         child: Text(
                //                             "الحساب : ${allBills[index].Pay}",
                //                             style: TextStyle(fontSize: 13)),
                //                       ),
                //                     ),
                //                     if (allBills[index].Cach != 0)
                //                       Expanded(
                //                         flex: 5,
                //                         child: Container(
                //                           alignment: Alignment.center,
                //                           child: Text(
                //                               "الكاش : ${allBills[index].Cach.toString()}",
                //                               style: TextStyle(fontSize: 15)),
                //                         ),
                //                       ),
                //                     Expanded(
                //                       flex: 2,
                //                       child: SizedBox(
                //                         width: 30,
                //                       ),
                //                     ),
                //                     Expanded(
                //                       flex: 5,
                //                       child: Container(
                //                         alignment: Alignment.centerLeft,
                //                         child: Text(
                //                             "الاجمالي : ${allBills[index].AllPrice}",
                //                             style: TextStyle(fontSize: 12)),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               )
                //             ],
                //           ));
                //     }))
                    ;
        
  }
}