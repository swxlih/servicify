import 'package:flutter/material.dart';

class TechnicianSignupPage extends StatefulWidget {
  const TechnicianSignupPage({super.key});

  @override
  State<TechnicianSignupPage> createState() => _TechnicianSignupPageState();
}

class _TechnicianSignupPageState extends State<TechnicianSignupPage> {
  final _regkey = GlobalKey<FormState>();
  var _usernamecontroller = TextEditingController();
  var _passwordcontroller = TextEditingController();
  var _namecontroller = TextEditingController();
  var _phonecontroller = TextEditingController();
  var _locationcontroller = TextEditingController();
  bool visible=true;

  final _loginKey=GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      //backgroundColor: Colors.red,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Form(
          key: _loginKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100,),
                Center(
                    child: Container(
                        child: Image.asset(
                          "assets/img/logo.png",
                          scale: 4,
                        ))),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is mandatory";
                    }
                  },

                  controller: _namecontroller,
                  cursorColor: Colors.redAccent,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Colors.red,),
                    hintText: "Name",
                    hintStyle: TextStyle(
                        color: Colors.redAccent
                    ),

                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.redAccent
                        )

                    ),

                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is mandatory";
                    }
                  },

                  controller: _phonecontroller,
                  cursorColor: Colors.redAccent,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone,color: Colors.red,),
                    hintText: "Phone",
                    hintStyle: TextStyle(
                        color: Colors.redAccent
                    ),

                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.redAccent
                        )

                    ),

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is mandatory";
                    }
                  },

                  controller: _usernamecontroller,
                  cursorColor: Colors.redAccent,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,color: Colors.red,),
                    hintText: "Email",
                    hintStyle: TextStyle(
                        color: Colors.redAccent
                    ),

                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.redAccent
                        )

                    ),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: visible,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is mandatory";
                    }
                  },

                  controller: _passwordcontroller,
                  cursorColor: Colors.redAccent,
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
                      icon: visible==true?Icon(Icons.visibility_off,color: Colors.red,):
                      Icon(Icons.visibility,color: Colors.red,),

                    ),
                    prefixIcon: Icon(Icons.lock,color: Colors.red,),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.redAccent
                    ),

                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.redAccent
                        )

                    ),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is mandatory";
                    }
                  },

                  controller: _locationcontroller,
                  cursorColor: Colors.redAccent,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on,color: Colors.red,),
                    hintText: "Location",
                    hintStyle: TextStyle(
                        color: Colors.redAccent
                    ),

                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.redAccent
                        )

                    ),

                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(onPressed: (){

                    var res=_loginKey.currentState!.validate();
                    print(res);

                    if(_loginKey.currentState!.validate()){

                      print(_usernamecontroller.text);
                      print(_passwordcontroller.text);
                    }
                    else{
                      print("validation error");
                    }

                  }, child: Text("Sign Up"),),
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Registered?"),
                    TextButton(onPressed: (){
                      Navigator.pop(context);

                    }, child: Text("Login"))
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
