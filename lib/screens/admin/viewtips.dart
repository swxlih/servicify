import 'package:flutter/material.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';


class ViewAllTips extends StatefulWidget {
  const ViewAllTips({super.key});

  @override
  State<ViewAllTips> createState() => _ViewAllTipsState();
}

class _ViewAllTipsState extends State<ViewAllTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: primaryColor,
        title: Text(
          "View Tips",
          style: appbarStyle,
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){


                return Card(
                  child: ListTile(

                    onTap: (){


                      showModalBottomSheet(context: context, builder: (context){



                        return Container(
                          padding: EdgeInsets.all(30),
                          height:350,
                          width: MediaQuery.of(context).size.width,


                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Service are not offering as per the advertisement"),
                              SizedBox(height:20,),
                              Text("The service is not up to the mark, customer service is not responding to calls properly"),
                              SizedBox(height:20,),


                              SizedBox(height:20,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  ElevatedButton(

                                      onPressed: (){}, child: Text("Cancel")),
                                  ElevatedButton(onPressed: (){}, child: Text("Delete")),
                                ],
                              )

                            ],
                          ),
                        );
                      });




                    },
                    title: Text("Title"),
                    subtitle: Text("Message"),
                  ),
                );

              })
      ),

    );
  }
}

