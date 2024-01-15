import 'package:flutter/material.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';


class ViewLapServices extends StatefulWidget {
  const ViewLapServices({super.key});

  @override
  State<ViewLapServices> createState() => _ViewLapServicesState();
}

class _ViewLapServicesState extends State<ViewLapServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: primaryColor,
        title: Text(
          "View lap services",
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
                    leading: CircleAvatar(
                      radius: 20,
                      child: Text("${index+1}"),
                    ),


                    title: Text("Title"),
                    subtitle: Text("Description"),
                    trailing: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.delete),
                    ),

                  ),
                );

              })
      ),

    );
  }
}

