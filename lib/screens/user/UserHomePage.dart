import 'package:flutter/material.dart';
import 'package:servicify/screens/common/login_page.dart';
import 'package:servicify/screens/user/RamUpgrade.dart';

import 'package:servicify/screens/user/lapservice.dart';
import 'package:servicify/screens/user/lapserviceman.dart';

import '../constants/colors.dart';
import '../constants/textstyles.dart';



class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Container(
              padding: EdgeInsets.all(20),
              height: 180,
              width: MediaQuery.of(context).size.width*0.88,
              decoration: BoxDecoration(
                  color:Colors.teal,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Text("40% off",style: TextStyle(color: Colors.white,fontSize: 28),),

                        Text("Full car wash",style: TextStyle(color: Colors.white,fontSize: 20)),
                        Container(
                          height: 45,
                          width: 200,
                          decoration: BoxDecoration(color: Colors.black,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(child: Text("Book Now".toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 16)),),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Image.asset('assets/img/logo.png'),
                    ),
                  )

                ],
              ),
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Laptop Services".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                ,InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LapServices()));

                    },
                    child: Text("See All".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 14),))
              ],
            ),
            SizedBox(height: 20,),

            InkWell(
              onTap: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LapServiceMan()));

              },
              child: Stack(


                children: [
                  Card(
                    elevation: 7,
                    child: Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width*0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: Container(
                        height: 130,
                        width: 100,
                        color: Color(0xFF80CBC4),
                      )),
                  Positioned(
                    top: 50,
                    left: 20,

                    child: Image.asset('assets/img/logo.png',height: 40,width: 60,),),
                  Positioned(
                    right: 100,
                    top: 10,
                    child: Text("Chip Level",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                  Positioned(
                    left: 160,
                    top: 40,
                    child: Text("yyyyyyyyyyyyyy",style: TextStyle(fontSize: 18),),
                  ),

                  Positioned(
                    left: 220,
                    bottom: 10,
                    child: Text("Rs-1000/-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  )

                ],

              ),
            ),
            SizedBox(height: 15,),
            Stack(

              children: [
                Card(
                  elevation: 7,
                  child: Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width*0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 130,
                      width: 100,
                      color: Color(0xFF80CBC4),
                    )),
                Positioned(
                  top: 50,
                  left: 20,

                  child: Image.asset('assets/img/logo.png',height: 40,width: 60,),),
                Positioned(
                  right: 100,
                  top: 10,
                  child: Text("RAM Upgrade",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                ),
                Positioned(
                  left: 160,
                  top: 40,
                  child: Text("yyyyyyyyyyyyyy",style: TextStyle(fontSize: 18),),
                ),

                Positioned(
                  left: 220,
                  bottom: 10,
                  child: Text("Rs-1000/-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                )

              ],

            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Mobile service".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                ,Text("See All".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 14),)
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 40,
                          child: Center(
                            child: Icon(Icons.phone_iphone,size: 33,color: Colors.white,),
                          ),
                        ),
                        Text("Display")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 40,
                          child: Center(
                            child: Icon(Icons.phone_iphone,size: 33,color: Colors.white,),
                          ),
                        ),
                        Text("Battery change")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 40,
                          child: Center(
                            child: Icon(Icons.phone_iphone,size: 33,color: Colors.white,),
                          ),
                        ),
                        Text("Port service")
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 40,
                          child: Center(
                            child: Icon(Icons.phone_iphone,size: 33,color: Colors.white,),
                          ),
                        ),
                        Text("Body changing")
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 40,
                          child: Center(
                            child: Icon(Icons.phone_iphone,size: 33,color: Colors.white,),
                          ),
                        ),
                        Text("Software ")
                      ],
                    ),
                  ),





                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
