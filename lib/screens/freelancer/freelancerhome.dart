import 'package:flutter/material.dart';
import 'package:servicify/screens/common/login_page.dart';
import 'package:servicify/screens/constants/textstyles.dart';
import 'package:servicify/screens/freelancer/addlapservice.dart';
import 'package:servicify/screens/freelancer/addmobileservice.dart';
import 'package:servicify/screens/freelancer/viewlapservice.dart';
import 'package:servicify/screens/freelancer/viewmobileservice.dart';
import 'package:servicify/screens/shop/addmobilesevice.dart';
import 'package:servicify/screens/shop/addshopservice.dart';
import 'package:servicify/screens/shop/addworker.dart';
import 'package:servicify/screens/shop/viewlaptopservice.dart';
import 'package:servicify/screens/shop/viewmobileservice.dart';

import '../constants/colors.dart';
class FreelancerHome extends StatefulWidget {
  const FreelancerHome({super.key});

  @override
  State<FreelancerHome> createState() => _FreelancerHomeState();
}

class _FreelancerHomeState extends State<FreelancerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.grid_view_outlined,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        title: Text(
          "Freelancer Home",
          style: appbarStyle,
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage()));
          }, icon: Icon(Icons.logout_sharp,color: Colors.white,))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddFrlcrLapService()));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                      child: Center(child: Text("Add Lap Services",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewFrlcrLapServices()));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                      child: Center(child: Text("View lap Services",style: TextStyle(color: Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddFrlcrMobileService()));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                      child: Center(child: Text("Add Mobile Services",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewFrlcrMobileServices()));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                      child: Center(child: Text("View mobile Services",style: TextStyle(color: Colors.white))),
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
