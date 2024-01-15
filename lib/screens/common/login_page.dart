import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicify/screens/admin/admin_home_page.dart';
import 'package:servicify/screens/common/signup.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/textstyles.dart';

import '../user/UserHomePage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginkey = GlobalKey<FormState>();
  var _usernamecontroller = TextEditingController();
  var _passwordcontroller = TextEditingController();

  bool visible=true;

  final _loginKey=GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(

        ),
        padding: EdgeInsets.all(50),
        child: Form(
          key: _loginKey,
          child: CustomScrollView(

            slivers: [

              SliverFillRemaining(
                hasScrollBody: false,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Container(
                            width: 100, height: 85,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.transparent),
                            child: Image.asset(
                              "assets/img/logo.png",
                              scale: 1,
                            ))),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Servicify",
                        style:GoogleFonts.robotoSlab(fontSize: 26,letterSpacing: 5,fontWeight: FontWeight.bold,color: primaryColor,)
                      ),
                    ),
                    // Text(
                    //"Login",
                    // style: TextStyle(fontSize: 28),
                    //  ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(


                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is mandatory";
                        }
                      },

                      controller: _usernamecontroller,
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color:primaryColor,),
                        hintText: "User Name",
                        hintStyle: TextStyle(
                            color:primaryColor,
                        ),

                        enabledBorder: UnderlineInputBorder(

                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: primaryColor,
                            )

                        ),

                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    TextFormField(


                      obscureText: visible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is mandatory";
                        }
                      },

                      controller: _passwordcontroller,
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
                        prefixIcon: Icon(Icons.lock,color:primaryColor,),
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
                    SizedBox(
                      height: 20,
                    ),

                    Center(
                      child: InkWell(
                        onTap: (){
                          if(_loginKey.currentState!.validate()) {
                            print(_usernamecontroller.text);
                            print(_passwordcontroller.text);

                            if (_usernamecontroller.text == "admin@gmail.com" &&
                                _passwordcontroller.text == "12345678") {
                              Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) =>
                              AdminHomePage()));
                            }
                             else if(_usernamecontroller.text == "user@gmail.com" &&
                                _passwordcontroller.text=="12345678"){
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (context) =>
                                  UserHomePage()));
                            }
                          }
                        },
                        child: Container(
                          width: 250,
                          height: 49,

                          decoration: BoxDecoration(
                            color: const Color(0xff1F619D),
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Center(

                              child: Text("Login",style: GoogleFonts.robotoSlab(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)


                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",style: normalStyle,),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));

                        }, child: Text("Sign up",style: normalStylebold,))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        TextButton(onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>TechnicianHomePage()));

                        }, child: Text("Sign in as a Technician!",style: normalStylebold,))
                      ],
                    ),



                  ],
                ),
              )


            ],
          )
        ),
      ),
    );
  }
}