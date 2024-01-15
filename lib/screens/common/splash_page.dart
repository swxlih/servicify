import 'package:flutter/material.dart';
import 'package:servicify/screens/common/login_page.dart';
import 'package:servicify/screens/constants/colors.dart';
import 'package:servicify/screens/constants/images.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {





  @override
  void initState() {

    Future.delayed(Duration(seconds: 3),(){


      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

  
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             Image.asset(logoPath,height: 150,),
             SizedBox(height: 20,),
             Text("Servicify".toUpperCase(),style: TextStyle(color: captionColor,fontSize: 26,fontWeight: FontWeight.bold),)



            ],
          ),
        ),
      ),
    );
  }
}
