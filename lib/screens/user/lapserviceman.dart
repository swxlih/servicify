import 'package:flutter/material.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';
import 'package:url_launcher/url_launcher.dart';

class LapServiceMan extends StatefulWidget {
  const LapServiceMan({super.key});

  @override
  State<LapServiceMan> createState() => _LapServiceManState();
}

class _LapServiceManState extends State<LapServiceMan>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Chip Level",
          style: appbarStyle,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(

              itemCount: 5,
              itemBuilder: (BuildContext context,int index){

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),

                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 50,
                          child: Text("${index+1}"),
                        ),
                        title: Text("Name:"),
                        subtitle: Text("Phone No:"),
                        trailing: IconButton(
                          onPressed:
                              (){

                          },
                          icon: Icon(Icons.phone),
                        ),

                      ),
                    ),
                  ),
                );
              }
          ),
        ),
      ),

    );
  }


}

