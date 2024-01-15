import 'package:flutter/material.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';


class ViewAllUsers extends StatefulWidget {
  const ViewAllUsers({super.key});

  @override
  State<ViewAllUsers> createState() => _ViewAllUsersState();
}

class _ViewAllUsersState extends State<ViewAllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: primaryColor,
        title: Text(
          "View All Users",
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
                          padding: EdgeInsets.all(20),
                          height: 200,
                          width: MediaQuery.of(context).size.width,


                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Shop Name"),
                              Text("Email"),
                              Text("Phone"),
                              Text("ServiceType"),

                            ],
                          ),
                        );
                      });




                    },
                    title: Text("Name"),
                    subtitle: Text("Email"),
                  ),
                );

              })
      ),

    );
  }
}

