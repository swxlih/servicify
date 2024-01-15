import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';
class AddWorker extends StatefulWidget {
  const AddWorker({super.key});

  @override
  State<AddWorker> createState() => _AddWorkerState();
}

class _AddWorkerState extends State<AddWorker> {


  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();

  TextEditingController _phoneController=TextEditingController();
  TextEditingController _expController=TextEditingController();

  List<String>service=[
    'Ram upgrade','chip level'
  ];

  String? selectedservice;



  final key=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: primaryColor,
        title: Text(
          "Add User",
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
                  controller: _nameController,

                  decoration: InputDecoration(

                    hintText: "Name",
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

                  controller: _emailController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(

                    hintText: "Email",
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

                  controller: _phoneController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(

                    hintText: "Phone",
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

                  controller: _expController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(

                    hintText: "Experience",
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



                SizedBox(height: 20,),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(

                    hintText: "Select City",
                    hintStyle: TextStyle(
                      color: primaryColor,
                    ),

                    enabledBorder:UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(

                        )

                    ),

                  ),
                  value: selectedservice,
                  items: service
                      .map((s) => DropdownMenuItem<String>(
                      value: s, child: Text(s)))
                      .toList(),
                  onChanged: (value) {

                    selectedservice=value;

                  },
                ),




                SizedBox(height: 20,),

                Center(
                  child: InkWell(
                    onTap: (){

                      if(key.currentState!.validate()){
                        showsnackbar("Registered Succesfully");
                        Navigator.pop(context);



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
