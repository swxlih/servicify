import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicify/data/city_list.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';


class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {


  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _phoneController=TextEditingController();



  final key=GlobalKey<FormState>();


  String?selectedCity;
  bool visible=true;
  bool _checked=false;
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


                  obscureText: visible,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is mandatory";
                    }
                  },

                  controller: _passwordController,
                  cursorColor:primaryColor,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(

                      onPressed: (){

                        if(visible==true){
                          setState(() {
                            visible=false;
                          });
                        }
                        else{
                          setState(() {
                            visible=true;
                          });
                        }

                      },
                      icon: visible==true?Icon(Icons.visibility_off,color:primaryColor,):
                      Icon(Icons.visibility,color: primaryColor,),

                    ),

                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: primaryColor,
                    ),

                    enabledBorder:UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:primaryColor,
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
                  value: selectedCity,
                  items: malappuramCities
                      .map((city) => DropdownMenuItem<String>(
                      value: city, child: Text(city)))
                      .toList(),
                  onChanged: (value) {

                    selectedCity=value;

                  },
                ),




                SizedBox(height: 20,),

                Center(
                  child: InkWell(
                    onTap: (){

                      if(key.currentState!.validate()){



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
}
