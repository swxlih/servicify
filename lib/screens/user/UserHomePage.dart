import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servicify/screens/common/login_page.dart';
import 'package:servicify/screens/user/RamUpgrade.dart';
import 'package:servicify/screens/user/batterypage.dart';
import 'package:servicify/screens/user/bodypage.dart';
import 'package:servicify/screens/user/camerapage.dart';
import 'package:servicify/screens/user/displaypage.dart';

import 'package:servicify/screens/user/lapservice.dart';
import 'package:servicify/screens/user/lapserviceman.dart';
import 'package:servicify/screens/user/portpage.dart';
import 'package:servicify/screens/user/softwarepage.dart';
import 'package:servicify/screens/user/speakerpage.dart';
import 'package:servicify/screens/user/waterpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';
import '../constants/textstyles.dart';



class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
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

                Text("Laptop Services".toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                ,InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LapServices(

                                createdid: _uid,
                                createdby: _name,
                              )));

                    },
                    child: Text("See All".toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 14),))
              ],
            ),
            SizedBox(height: 20,),

            Container(

                height: 350,
                width: double.infinity,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("lapservices").
                    where("status",isEqualTo: 1).limit(2).
                    snapshots(),
                    builder: (context,  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                      if(!snapshot.hasData){
                        // still waiting for data to come
                        return Center(child: CircularProgressIndicator());

                      }
                      else if(snapshot.hasData &&  snapshot.data!.docs.length==0) {
                        // got data from snapshot but it is empty

                        return Center(child: Text("No Data found"));
                      }
                      else
                        return ListView.builder(
                          itemCount:snapshot.data!.docs.length ,
                          itemBuilder: (context,index){
                            return  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LapServiceMan(
                                            servicetype: snapshot.data!.docs[index]['servicetype'],
                                            createdid: _uid,
                                            createdby: _name,

                                          )));

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
                                      left: 100,
                                      top: 15,
                                      child: Expanded(
                                          child: Text(snapshot.data!.docs[index]['servicetype'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
                                    ),
                                    Positioned(
                                      left: 160,
                                      top: 50,
                                      child: Text(snapshot.data!.docs[index]['title'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    ),

                                    Positioned(
                                      left: 220,
                                      bottom: 10,
                                      child: Text("${snapshot.data!.docs[index]['cost']}/-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    )

                                  ],

                                ),
                              ),
                            );

                          },

                        );
                    }
                )
            ),


            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Mobile service".toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                // ,Text("See All".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 14),)
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DisplayPage(
                                createdid: _uid,
                                createdby: _name,

                              )));

                    },
                    child: Container(
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
                          Text("Display",style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BatteryPage(
                                createdid: _uid,
                                createdby: _name,

                              )));

                    },
                    child: Container(
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
                          Text("Battery change",style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PortPage(
                                createdid: _uid,
                                createdby: _name,

                              )));

                    },
                    child: Container(
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
                          Text("Port service",style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BodyPage(
                                createdid: _uid,
                                createdby: _name,

                              )));

                    },
                    child: Container(
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
                          Text("Body changing",style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CameraPage(
                                createdid: _uid,
                                createdby: _name,

                              )));

                    },
                    child: Container(
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
                          Text("Camera Change",style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WaterPage(
                                createdid: _uid,
                                createdby: _name,

                              )));

                    },
                    child: Container(
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
                          Text("Water Damage",style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SpeakerPage(
                                createdid: _uid,
                                createdby: _name,

                              )));

                    },
                    child: Container(
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
                          Text("Speaker Repair",style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SoftwarePage(
                                createdid: _uid,
                                createdby: _name,

                              )));

                    },
                    child: Container(
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
                          Text("Software",style: TextStyle(color: Colors.white),)
                        ],
                      ),
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
