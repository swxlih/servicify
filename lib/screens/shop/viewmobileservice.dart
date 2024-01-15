import 'package:flutter/material.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';
import 'package:servicify/screens/shop/mobileservicedetail.dart';


class ViewMobileServices extends StatefulWidget {
  const ViewMobileServices({super.key});

  @override
  State<ViewMobileServices> createState() => _ViewMobileServicesState();
}

class _ViewMobileServicesState extends State<ViewMobileServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: primaryColor,
        title: Text(
          "View mobile services",
          style: appbarStyle,
        ),
      ),
      body: InkWell(
        onTap: (){

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MobileServDetail()));
        },
        child: Container(
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
      ),

    );
  }
}

