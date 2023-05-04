import 'package:flutter/material.dart';
import 'package:yathaarth_gyaanam/hidden.dart';
import 'package:yathaarth_gyaanam/intro/firstpage.dart';
import 'package:yathaarth_gyaanam/screen/mail.dart';
import 'package:yathaarth_gyaanam/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Drawers extends StatefulWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  late SharedPreferences logindata;
  late bool newuser;
  late String username;
  var COLOR = Colors.white ;
  var COLORS = Color(0xff035891) ;


  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(34),bottomRight: Radius.circular(34)),
        ),
        backgroundColor: Colors.orangeAccent,
        child: SingleChildScrollView( scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 30,),

              Container( height: 190,width: double.maxFinite,
                // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                child: Image.asset("assets/images/f16.jpg",fit: BoxFit.fitWidth,height: MediaQuery.of(context).size.height,),
              ),


              Divider(height: 2,color:COLOR,),
              ListTile(
                // tileColor: Color(0xff63ACAC),
                title: Row(
                  children: [
                    SizedBox(width: 10,),
                    Image.asset("assets/images/drawer2.png",color: Colors.white,height: 40,),

                    Text("\t \t\t\t Technologies Used", style: TextStyle(fontWeight: FontWeight.bold,
                        color: COLOR,fontSize: 18),),
                  ],
                ),
                //  subtitle: Text("view"),
                onTap: () {
                  showDialog(context: context,
                      builder:(BuildContext context)=> AlertDialog(
                        backgroundColor: Colors.orange,
                        actions: [
                          Container(
                            height: 400  ,width:double.maxFinite,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                SizedBox(height: 30,),
                                Text("Technologies Used",
                                  style: TextStyle(fontSize: 21, color:COLORS,
                                      fontWeight: FontWeight.bold),
                                ),

                              ],
                            ),
                          )
                        ],
                      )
                  );
                },
              ),

              Divider(height: 4,color:COLOR),
              ListTile(
                // tileColor: Color(0xff63ACAC),
                title: Row(
                  children: [
                    SizedBox(width: 10,),
                    Image.asset("assets/images/drawer4.png",color: Colors.white,height: 36,),
                    Text("\t\t\t\t  Content Source", style: TextStyle(fontWeight: FontWeight.bold,
                        color:COLOR,fontSize: 18),),
                  ],
                ),
                //  subtitle: Text("view"),
                onTap: () {
                  showDialog(context: context,
                      builder:(BuildContext context)=> AlertDialog(
                        backgroundColor: Colors.orange,
                        actions: [
                          Container(
                            height: 400  ,width:double.maxFinite,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                SizedBox(height: 30,),
                                Text("Content Source",
                                  style: TextStyle(fontSize: 21, color: COLORS,
                                      fontWeight: FontWeight.bold),
                                ),

                              ],
                            ),
                          )
                        ],
                      )
                  );
                },
              ),
              Divider(color:COLOR),
              ListTile(
                // tileColor: Color(0xff63ACAC),
                title: Row(
                  children: [
                    SizedBox(width: 10,),
                    Image.asset("assets/images/drawer3.png",color: Colors.white,height: 37,),

                    Text("\t\t\t\t  Support Email",
                        style: TextStyle(fontWeight: FontWeight.bold,color:COLOR,fontSize: 18)),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => Mail()));
                },
              ),
              Divider(height: 4,color:COLOR),
              ListTile(
                // tileColor: Color(0xff63ACAC),
                title: Row(
                  children: [
                    SizedBox(width: 10,),
                    Image.asset("assets/images/drawer1.png",color: Colors.white,height: 40,),

                    Text("\t\t\t\t  Develop By",
                        style: TextStyle(fontWeight: FontWeight.bold,color:COLOR,fontSize: 18)),
                  ],
                ),
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,builder: (BuildContext context) {
                    return Container(
                      color: Color(0xffF79A00),height: 400,
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Text("Develop By",style: TextStyle(color:Colors.white,
                              fontWeight:FontWeight.bold, fontSize: 22),)
                        ],
                      ),
                    );
                  },
                  );
                },
              ),

              Divider(height: 15,color: COLOR),

             Padding(
               padding: const EdgeInsets.only(top: 192,right: 250),
               child: InkWell(child: Container(color:Colors.orangeAccent,height: 40,width: 50,),
               onLongPress: (){
                 Navigator.push(context,
                     new MaterialPageRoute(builder: (context) => Hidden()));

               }),
             )


            ],
          ),
        ));
  }
}
