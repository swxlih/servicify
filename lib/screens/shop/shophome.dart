import 'package:flutter/material.dart';
import 'package:servicify/screens/constants/textstyles.dart';
import 'package:servicify/screens/shop/addmobilesevice.dart';
import 'package:servicify/screens/shop/addshopservice.dart';
import 'package:servicify/screens/shop/addworker.dart';
import 'package:servicify/screens/shop/viewlaptopservice.dart';
import 'package:servicify/screens/shop/viewmobileservice.dart';

import '../constants/colors.dart';
class ShopHome extends StatefulWidget {
  const ShopHome({super.key});

  @override
  State<ShopHome> createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {
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
                                builder: (context) => AddLapService()));
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
                                builder: (context) => ViewLapServices()));
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
                                builder: (context) => AddMobileService()));
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
                                builder: (context) => ViewMobileServices()));
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
                                builder: (context) => AddWorker()));
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

              ],
            ),


          ],
        ),
      ),
    );

  }
}
