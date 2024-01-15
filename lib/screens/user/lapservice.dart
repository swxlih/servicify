import 'package:flutter/material.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';
import 'package:servicify/screens/user/lapserviceman.dart';
class LapServices extends StatefulWidget {
  const LapServices({super.key});

  @override
  State<LapServices> createState() => _LapServicesState();
}

class _LapServicesState extends State<LapServices> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "LapTop Services",
          style: appbarStyle,
        ),
      ),
      body: SafeArea(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LapServiceMan()));
          },
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 7,
                itemBuilder: (BuildContext context,int index){
                  return
                    Padding(
                      padding: const EdgeInsets.only(left: 25,top: 10,bottom: 10),
                      child: InkWell(

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
                    );
                }),
          ),
        ),
      ),
    );
  }
}
