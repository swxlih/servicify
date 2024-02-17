import 'package:flutter/material.dart';
import 'package:servicify/screens/admin/viewAllnotifications.dart';
import 'package:servicify/screens/admin/viewtips.dart';
import 'package:servicify/screens/common/login_page.dart';
import 'package:servicify/screens/constants/textstyles.dart';
import 'package:servicify/screens/shop/acceptedshoprequest.dart';
import 'package:servicify/screens/shop/addmobilesevice.dart';
import 'package:servicify/screens/shop/addshopservice.dart';
import 'package:servicify/screens/shop/addworker.dart';
import 'package:servicify/screens/shop/shopbooking.dart';
import 'package:servicify/screens/shop/viewlaptopservice.dart';
import 'package:servicify/screens/shop/viewmobileservice.dart';
import 'package:servicify/screens/shop/viewnotification.dart';
import 'package:servicify/screens/shop/viewtips.dart';
import 'package:servicify/screens/shop/viewworkers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';
class ShopHome extends StatefulWidget {

  const ShopHome({super.key});

  @override
  State<ShopHome> createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String? _name;
  String? _email;
  String? _phone;
  String? token;
  String? _location;


  Map<String, dynamic> data = {};
  String? _uid;
  getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    token = await _pref.getString('token');
    _name = await _pref.getString(
      'name',
    );

    _email = await _pref.getString(
      'email',
    );
    _phone = await _pref.getString(
      'phone',
    );
    _location = await _pref.getString(
      'location',
    );


    _uid = await _pref.getString(
      'uid',
    );


    setState(() {

    });
  }


  @override
  void initState() {
    getData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Text("${_name![0]}",style: TextStyle(color: Colors.white,fontSize: 20),),
                        backgroundColor: primaryColor,
                        radius: 30,
                      ),
                      SizedBox(height: 10,),
                      Text("${_email}",style: TextStyle(color: primaryColor),)
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewNotifications()));
                    },

                      child: Text("Notifications",style: TextStyle(color: primaryColor,fontSize: 18),)),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  GestureDetector(
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewTips()));
                      },
                      child: Text("Tips",style: TextStyle(color: primaryColor,fontSize: 18),)),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Text("Logout",style: TextStyle(color: primaryColor,fontSize: 18),),
                  IconButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()));
                  }, icon: Icon(Icons.logout,color: primaryColor,))
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(

        backgroundColor: primaryColor,
        title: Text(
          "Shop Home",
          style: appbarStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddLapService(
                                  createdby: _name,
                                  createdid: _uid,
                                )));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: Center(child: Text("Add Lap Services",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(  
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewLapServices(
                                  createdid: _uid,
                                )));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: Center(child: Text("View lap Services",style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ),
                ),
              ],  
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddMobileService(
                                  createdby: _name,
                                  createdid: _uid,
                                )));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: Center(child: Text("Add Mobile Services",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(  
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewMobileServices(
                                  createdid: _uid,
                                )));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: Center(child: Text("View mobile Services",style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddWorker(
                                  createdid: _uid,
                                  createdby:_name
                                )));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: Center(child: Text("Add Workerss",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewWorkers(
                                    createdid: _uid,

                                )));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: Center(child: Text("View Workerss",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShopBooking(id: _uid,)));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: Center(child: Text("View Bookings",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AcceptShopRequest(
                                  id: _uid,
                                )));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: Center(child: Text("Accepted Request",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ),

              ],
            ),


          ],
        ),
      ),
    );

  }
}
