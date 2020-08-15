import 'package:Shope_desgine/ui/bottomPage/AboutUsScreen.dart';
import 'package:Shope_desgine/ui/bottomPage/AddOrderScreen.dart';
import 'package:Shope_desgine/ui/bottomPage/GallaryScreen.dart';
import 'package:Shope_desgine/ui/bottomPage/NotificationScreen.dart';
import 'package:Shope_desgine/ui/bottomPage/SectionsScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
    theme: ThemeData(primaryColor: Color(0xffA3721C), fontFamily: "Regular"),
  ));
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexB = 0;
  String titleApp = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: indexB == 0
            ? Container(
              margin: EdgeInsets.only(top: 10),
              child: Image.asset(
                  "assets/images/logo.png",
                ),
            )
            : Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  getTitle(indexB),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
        backgroundColor:
            indexB == 0 ? Colors.grey[100] : Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[100],
        color: Colors.white,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        height: 70,
        animationDuration: Duration(
          milliseconds: 200,
        ),
        index: 0,
        animationCurve: Curves.bounceInOut,
        items: <Widget>[
          Icon(Icons.home,
              size: 30, color: indexB == 0 ? Colors.white : Colors.grey),
          Icon(Icons.grid_on,
              size: 30, color: indexB == 1 ? Colors.white : Colors.grey),
          Icon(Icons.add,
              size: 40, color: indexB == 2 ? Colors.white : Colors.grey),
          Icon(Icons.more_horiz,
              size: 30, color: indexB == 3 ? Colors.white : Colors.grey),
          // Icon(Icons.more_horiz,
          //     size: 30, color: indexB == 4 ? Colors.white : Colors.grey),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            indexB = index;
          });
        },
      ),
      body: selectedWidget(indexB),
    );
  }

  Widget selectedWidget(int index) {
    if (index == 0) {
      return SectionsScreen();
    } else if (index == 1) {
      return GallaryScreen();
    } else if (index == 2) {
      return AddOrderScreen();
    } else if (index == 3) {
      return AboutUsScreen();
    }
    //  else if (index == 4) {
    //   return AboutUsScreen();
    // }
  }

  String getTitle(int index) {
    if (index == 1) {
      return "معرض الصور";
    } else if (index == 2) {
      return "إنشاء طلب";
    } else if (index == 3) {
       return "تواصل معنا";
    } 
  }
}
