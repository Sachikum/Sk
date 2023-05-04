import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yathaarth_gyaanam/T1.dart';
import 'package:yathaarth_gyaanam/intro/onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yathaarth_gyaanam/constant.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {


//----------------------------------------


  final username_controller = TextEditingController();
  final gmail_controller = TextEditingController();
  final password_controller = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => T1()));
    }
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    password_controller.dispose();
    gmail_controller.dispose();
    super.dispose();
  }
//------------------------------------------
  Future<void> checkUserLog() async
  {
    final FirebaseAuth auth = await FirebaseAuth.instance;
    final user = await auth.currentUser;
    if(user != null)
    {
      constant.name = (await LocalDataSaver.getName())!;
      constant.email = (await LocalDataSaver.getEmail())!;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => T1()));
    }
  }
//--------------------------------------

//----------------------------------------

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds:3 ), () {
      check_if_already_login();
      checkUserLog();
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>const onboardscreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    //double h= MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Stack(
        children: [



          Container( width: MediaQuery.of(context).size.width,
              //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: SingleChildScrollView(scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 160,),
                    Image.asset("assets/images/f2.jpg",fit: BoxFit.cover,),

                    SizedBox(height: 30,),
                    Text("Yathaarth Gyaanam",style: TextStyle(fontSize: 30,color:Color(0xff347186),
                        fontWeight: FontWeight.bold ),)

                  ],
                ),
              )),

        ],
      )
    );
  }
}

class LocalDataSaver {
  static String nameKey = "NAMEKEY";
  static String emailKey = "EMAILKEY";
  static String logKey = "LOGWALIKEY";

  static Future<bool> saveName(String username) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameKey, username);
  }

  static Future<bool> saveMail(String useremail) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(emailKey, useremail);
  }


  static Future<String?> getName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nameKey);
  }


  static Future<String?> getEmail() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(emailKey);
  }




  static Future<bool> saveLoginData(bool isUserLoggedIn)
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(logKey, isUserLoggedIn);
  }

  static Future<bool?> getLogData() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(logKey);
  }
}
