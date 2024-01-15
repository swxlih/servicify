import 'package:flutter/material.dart';
import 'package:servicify/screens/constants/colors.dart';

import '../constants/textstyles.dart';


class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {

  TextEditingController _titleController=TextEditingController();
  TextEditingController _msgController=TextEditingController();


  final _notiKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: primaryColor,
        title: Text(
          "Add Notification",
          style: appbarStyle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: _notiKey,
          child: Column(
            children: [

              TextFormField(
                controller: _titleController,
                validator: (value){

                  if(value!.isEmpty){

                    return"Title is mandatory";
                  }
                },

                // controller to be added
                decoration: InputDecoration(
                    hintText: "Title"
                ),

              ),

              TextFormField(
                controller: _msgController,
                validator: (value){

                  if(value!.isEmpty){

                    return"Message is mandatory";
                  }
                },

                // controller to be added
                decoration: InputDecoration(
                    hintText: "Message"
                ),

              ),

              SizedBox(height:20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  ElevatedButton(

                      onPressed: (){




                      }, child: Text("Cancel")),
                  ElevatedButton(onPressed: (){

                    if(_notiKey.currentState!.validate()){


                      // send data to firebase
                    }
                  }, child: Text("Send")),
                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}
