import 'package:flutter/material.dart';
import 'package:servicify/screens/shop/addshopservice.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';


class ViewAllShops extends StatefulWidget {
  const ViewAllShops({super.key});

  @override
  State<ViewAllShops> createState() => _ViewAllShopsState();
}

class _ViewAllShopsState extends State<ViewAllShops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: primaryColor,
        title: Text(
          "View All Shops",
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

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddLapService()));




              },
              title: Text("Shop Name"),
              subtitle: Text("Email"),
            ),
          );

        })
      ),

    );
  }
}

