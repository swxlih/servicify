import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicify/screens/admin/admin_home_page.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';
class AddTips extends StatefulWidget {
  const AddTips({super.key});

  @override
  State<AddTips> createState() => _AddTipsState();
}

class _AddTipsState extends State<AddTips> {
  TextEditingController _titleController=TextEditingController();
  TextEditingController _descriptinController=TextEditingController();

  final key=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        backgroundColor: primaryColor,
        title: Text(
          "Add Tips",
          style: appbarStyle,
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,

        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is mandatory";
                    }
                  },
                  cursorColor: primaryColor,
                  controller: _titleController,

                  decoration: InputDecoration(

                    hintText: "Title",
                    hintStyle: TextStyle(
                      color: primaryColor,
                    ),

                    enabledBorder:UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(

                        )

                    ),

                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is mandatory";
                    }
                  },

                  controller: _descriptinController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(

                    hintText: "Desription",
                    hintStyle: TextStyle(
                      color: primaryColor,
                    ),

                    enabledBorder:UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(

                        )

                    ),

                  ),
                ),
                SizedBox(height: 10,),

                SizedBox(height: 10,),

                SizedBox(height: 20,),

                Center(
                  child: InkWell(
                    onTap: (){

                      if(key.currentState!.validate()){
                        showsnackbar("Saved Succesfully");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminHomePage()));
                      }

                    },
                    child: Container(
                      width: 250,
                      height: 49,

                      decoration: BoxDecoration(
                          color: Color(0xff1F619D),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Center(

                          child: Text("Save",style: GoogleFonts.robotoSlab(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)


                      ),
                    ),
                  ),
                ),






              ],
            ),
          ),
        ),
      ),
    );
  }



  void showsnackbar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(value))
    );
  }
}
