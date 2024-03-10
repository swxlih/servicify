import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';
import 'package:servicify/screens/user/lapserviceman.dart';
class LapServices extends StatefulWidget {
  var servicetype;
 var createdby;
 var createdid;
   LapServices({super.key,this.servicetype,this.createdby,this.createdid});

  @override
  State<LapServices> createState() => _LapServicesState();
}

class _LapServicesState extends State<LapServices> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
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
          child:Container(

              height: double.infinity,
              width: double.infinity,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("lapservices").
                  where("status",isEqualTo: 1).
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
                                          createdid: widget.createdid,
                                          createdby: widget.createdby,
                                        )));

                              },
                              child: Center(
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

                                      child: Container(
                                        height: 40,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot.data!.docs[index]['url'],)
                                            )
                                        ),
                                      )

                                    ),
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
                            ),
                          );

                        },

                      );
                  }
              )
          ),
        ),
      ),
    );
  }
}
