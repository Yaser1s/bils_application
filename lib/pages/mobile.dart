import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test10/pages/justforthemaneger/bills_maneger/bills.dart';
import 'package:test10/pages/justforthemaneger/driver/driver.dart';
import 'package:test10/pages/justforthemaneger/farms_maneger/farms.dart';
import 'package:test10/pages/justforthemaneger/employee/employess.dart';
import 'package:test10/pages/justforthemaneger/merchants/merchants.dart';
import 'package:test10/shared/colors.dart';

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  //
  final PageController _pageController = PageController();

//

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

//

  int whowColorNow = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoTabBar(
            backgroundColor: mobileBackgroundColor,
            onTap: (index) {
              _pageController.jumpToPage(index);
              setState(() {
                whowColorNow = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: "الفواتير",
                  icon: Icon(Icons.home,
                      color:
                          whowColorNow == 0 ? primaryColor : secondaryColor)),
              BottomNavigationBarItem(
                  label: "الموظفين",
                  icon: Icon(
                      whowColorNow == 1 ? Icons.groups : Icons.groups_outlined,
                      color:
                          whowColorNow == 1 ? primaryColor : secondaryColor)),
              BottomNavigationBarItem(
                  label: "السواقين",
                  icon: Icon(
                      whowColorNow == 2 ? Icons.people : Icons.people_outline,
                      color:
                          whowColorNow == 2 ? primaryColor : secondaryColor)),
              BottomNavigationBarItem(
                  label: "المزارع",
                  icon: Icon(
                      whowColorNow == 3
                          ? Icons.add_business
                          : Icons.add_business_outlined,
                      color:
                          whowColorNow == 3 ? primaryColor : secondaryColor)),
              BottomNavigationBarItem(
                  label: "التجار",
                  icon: Icon(
                      whowColorNow == 4 ? Icons.work : Icons.work_outline_sharp,
                      color: whowColorNow == 4 ? primaryColor : secondaryColor))
            ]),
        body: PageView(
            onPageChanged: (index) {},
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: const [
              BillsForManegar(),
              Employees(),
              DriverPage(),
              Farms(),
              Merchants()
            ]));
  }
}
