import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicify/constants/colors.dart';
import 'package:servicify/screens/user/UserHomePage.dart';
import 'package:servicify/screens/user/bottomnavigation_widget.dart';
import 'package:servicify/screens/user/profilepage.dart';
import 'package:servicify/screens/user/services/bottombar_service.dart';
import 'package:servicify/screens/user/settings/settings_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  String? _name;
  String? _email;
  String? _phone;
  String? token;
  String? _location;
  var imggurl;

  Map<String, dynamic> data = {};
  String? _uid;
  getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    token = await _pref.getString('token');
    _name = await _pref.getString(
      'name',
    );

    _email = await _pref.getString(
      'email',
    );
    _phone = await _pref.getString(
      'phone',
    );
    _location = await _pref.getString(
      'location',
    );

    imggurl = await _pref.getString(
      'imgurl',
    );
    print(imggurl);

    // if (imggurl == null) {
    //   setState(() {
    //     imggurl = "assets/image/profile.png";
    //   });
    // }

    _uid = await _pref.getString(
      'uid',
    );

    print(data);
    setState(() {
      data = {
        "name": _name,
        "email": _email,
        "phone": _phone,
        "uid": _uid,
        "img": imggurl,
        "location": _location
      };
    });
  }

  @override
  void initState() {
    getData();
    initializePage();
    super.initState();
  }

  List _widgetOption = [];

  Future<void> initializePage() async {
    await getData();
    _widgetOption = [
      UserHomePage(),
      Text("hello"),
      Settingpage(),
      ProfilePage(),
    ];
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    String? name;
    String? email;
    String type;
    return Consumer<BottomBarServiceProvider>(
        builder: (context, bottomprovider, child) {
      return Scaffold(
          bottomNavigationBar: BottomNavigation(),
          drawer: Drawer(
              backgroundColor: AppColors.scaffoldColor,
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, $_name",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "$_email",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title:
                        Text("Logout", style: TextStyle(color: Colors.white)),
                    trailing: IconButton(
                      onPressed: () {
                        _logoutAndNavigateToLogin(context);
                      },
                      icon: Icon(Icons.logout, color: Colors.white),
                    ),
                  ),
                ],
              )),
          backgroundColor: AppColors.scaffoldColor,
          appBar: AppBar(
            backgroundColor: AppColors.scaffoldColor,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.grid_view_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: imggurl == "null"
                    ? CircleAvatar(
                        radius: 33,
                        backgroundImage:
                            AssetImage('assets/img/profile.png'),
                      )
                    : CircleAvatar(
                        radius: 33,
                        backgroundImage: NetworkImage('${imggurl}'),
                      ),
              ),
            ],
          ),
          body: _widgetOption.elementAt(bottomprovider.selectedIndex));
    });
  }

  void _logoutAndNavigateToLogin(BuildContext context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    FirebaseAuth.instance.signOut().then((value) {
      _pref.clear();
      Navigator.pushReplacementNamed(context, '/login');
    });

    // Navigate to the login page when the logout is successful
  }
}
