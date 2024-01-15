import 'package:flutter/material.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';


class ViewFrlcrLapServices extends StatefulWidget {
  const ViewFrlcrLapServices({super.key});

  @override
  State<ViewFrlcrLapServices> createState() => _ViewFrlcrLapServicesState();
}

class _ViewFrlcrLapServicesState extends State<ViewFrlcrLapServices> {
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


                    title: Text("Title"),
                    subtitle: Text("Description"),
                  ),
                );

              })
      ),

    );
  }
}

