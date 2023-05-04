import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:yathaarth_gyaanam/audioplay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yathaarth_gyaanam/heading/Religious.dart';
import 'package:yathaarth_gyaanam/heading/biography.dart';
import 'package:yathaarth_gyaanam/heading/fact.dart';
import 'package:yathaarth_gyaanam/heading/historical.dart';
import 'package:yathaarth_gyaanam/heading/iamtalk.dart';
import 'package:yathaarth_gyaanam/heading/indianwar.dart';
import 'package:yathaarth_gyaanam/hidden.dart';
import 'package:yathaarth_gyaanam/intro/firstpage.dart';
import 'package:yathaarth_gyaanam/modul/model.dart';
import 'package:yathaarth_gyaanam/screen/Choice.dart';
import 'package:yathaarth_gyaanam/screen/img_play.dart';
import 'package:yathaarth_gyaanam/screen/mail.dart';
import 'package:yathaarth_gyaanam/screen/videoplay.dart';
import 'package:yathaarth_gyaanam/screen/vidframe.dart';
import 'package:yathaarth_gyaanam/services/auth.dart';
import 'modul/models.dart';
import 'modul/modles2.dart';
import 'modul/models3.dart';
import 'modul/models4.dart';
import 'heading/poetry.dart';
import 'package:firebase_auth/firebase_auth.dart';


class T1 extends StatefulWidget {
  const T1({Key? key}) : super(key: key);

  @override
  State<T1> createState() => _T1State();
}

class _T1State extends State<T1> {

  late SharedPreferences logindata;
  late String username;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var COLOR = Colors.white ;

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds:2 ), () {
     message();
    });
    super.initState();
    initial();
  }


  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }


  //-----------------------------------------------------------
  void signOut() async
  {
    await googleSignIn.signOut();
    await _auth.signOut();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => FirstPage()));
  }
//--------------------------------------------------------------

  Future<void> message() async
  { showDialog(context: context,
      builder:(BuildContext context)=> AlertDialog(
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            height: 90  ,width:double.maxFinite,
            decoration: BoxDecoration(color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text("\t\tPlease keep The Internet \n on Will Using The This App",
                  style: TextStyle(fontSize: 19, color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),

              ],
            ),
          )
        ],
      )
      
  );  }


//-------------------------------------------------------------------

  Future<bool> onBackPressed() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor:  Colors.orange,
          actions: [
            Container( color: Colors.white,
              //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: Column(children: [
                SizedBox(height: 15,),
                Text("Are You Want To Exit ?",
                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                      fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),

                Row(children: [
                  SizedBox(width: 60,),
                  TextButton( onPressed:()=> Navigator.pop(context,false ),
                      child:Text("NO",style: TextStyle(color: Colors.orange ,fontWeight: FontWeight.bold,
                          fontSize: 22),)),

                  SizedBox(width: 20,),
                  TextButton(
                      onPressed: () {SystemNavigator.pop();},
                      child: Text("YES", style: TextStyle(color: Colors.red,fontSize: 22),
                      ))
                ],)

                , SizedBox(height: 5,),
              ],),
            )

          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        appBar: AppBar(title: Text("Yathaarth Gyaanam",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold),),backgroundColor: Color(0xffF79A00),centerTitle: true,
        ),

        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
  //---------------------------------
            Expanded(flex: 11,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children:[
//---------------------------------------------------------------------
                    SizedBox(height: 25,),
                    CarouselSlider(items: [
                      InkWell(
                        child: Container( height: 60,width: 270,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          child: Image.asset("assets/images/im2.jpg",fit: BoxFit.cover,),
                        ),
                        onTap: (){},
                      ),

                      //  SizedBox(width: 20,),
                      InkWell(
                        child: Container( height: 60,width: 270,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          child: Image.asset("assets/images/im3.jpg",fit: BoxFit.cover,),
                        ),onTap: (){},
                      ),

                      //  SizedBox(width: 20,),
                      InkWell(
                        child: Container( height: 60,width: 270,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          child: Image.asset("assets/images/im4.jpg",fit: BoxFit.cover,),
                        ),onTap: (){},
                      ),


                    ], options: CarouselOptions(autoPlay: true),),


                    //-------------------__fact--------------------------------------------------

                   SizedBox(height: 30,),

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        Text("Facts",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,color: Color(0xffF79A00)),),

                       SizedBox(width: 200,),
                        InkWell(
                          child: Text("View All >>",style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: Color(0xffF79A00)),),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Facts()));
                          },
                        ),

                      ],),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Row(
                        children: [
                          SizedBox( height:218,width:MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                                 itemCount: Model.Facts.length,
                                itemBuilder: (BuildContext context,index){
                              return InkWell(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                                  height: 340 ,width: 110,
                                  //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                  child: Column(
                                    children: [
                                      Image.asset(Model.Facts[index].image,fit: BoxFit.contain,height: 160,),
                                      SizedBox(height: 5,),
                                      Text("Patiyala ke Raja \n \t\t Bhupendra",
                                        style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                },
                              );
                            })
                          )
                        ],
                      ),
                    ),
                    //-----------------------

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text("Poetry",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,color: Color(0xffF79A00)),),

                        SizedBox(width: 190,),
                        InkWell(
                          child: Text("View All >>",style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: Color(0xffF79A00)),),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Poetry()));
                          },
                        ),

                      ],),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Row(
                        children: [
                          SizedBox( height:218,width:MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: Models.Poetry.length,
                                itemBuilder: (BuildContext context,index){
                                  return InkWell(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                                      height: 340 ,width: 110,
                                      //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                      child: Column(
                                        children: [
                                          Image.asset(Models.Poetry[index].images,fit: BoxFit.contain,height: 160,),
                                          SizedBox(height: 5,),
                                          Text("Patiyala ke Raja \n \t\t Bhupendra",
                                            style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                    },
                                  );
                                })
                          )
                        ],
                      ),
                    ),

                    //-----------------------

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text("Religions",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,color: Color(0xffF79A00)),),

                        SizedBox(width: 170,),
                        InkWell(
                          child: Text("View All >>",style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: Color(0xffF79A00)),),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Religious()));
                          },
                        ),

                      ],),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Row(
                        children: [
                          SizedBox( height:218,width:MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: Models3.Religious.length,
                                itemBuilder: (BuildContext context,index){
                                  return InkWell(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                                      height: 340 ,width: 110,
                                      //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                      child: Column(
                                        children: [
                                          Image.asset(Models3.Religious[index].images1,fit: BoxFit.contain,height: 160,),
                                          SizedBox(height: 5,),
                                          Text("Patiyala ke Raja \n \t\t Bhupendra",
                                            style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                    },
                                  );
                                })
                          )
                        ],
                      ),
                    ),
                    //------------------------

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text("Historical",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,color: Color(0xffF79A00)),),

                        SizedBox(width: 175,),
                        InkWell(
                          child: Text("View All >>",style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: Color(0xffF79A00)),),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Historical()));
                          },
                        ),

                      ],),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Row(
                        children: [
                          SizedBox( height:218,width:MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: Models2.History.length,
                                itemBuilder: (BuildContext context,index){
                                  return InkWell(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                                      height: 340 ,width: 110,
                                      //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                      child: Column(
                                        children: [
                                          Image.asset(Models2.History[index].images1,fit: BoxFit.contain,height: 160,),
                                          SizedBox(height: 5,),
                                          Text("Patiyala ke Raja \n \t\t Bhupendra",
                                            style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                    },
                                  );
                                })
                          )
                        ],
                      ),
                    ),
                    //-------------------------

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text("I AM Talking",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,color: Color(0xffF79A00)),),

                        SizedBox(width: 140,),
                        InkWell(
                          child: Text("View All >>",style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: Color(0xffF79A00)),),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Talking()));
                          },
                        ),

                      ],),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Row(
                        children: [
                          SizedBox( height:218,width:MediaQuery.of(context).size.width,
                            child:ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: Models4.talking.length,
                                itemBuilder: (BuildContext context,index){
                                  return InkWell(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                                      height: 340 ,width: 110,
                                      //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                      child: Column(
                                        children: [
                                          Image.asset(Models4.talking[index].images1,fit: BoxFit.contain,height: 160,),
                                          SizedBox(height: 5,),
                                          Text("Patiyala ke Raja \n \t\t Bhupendra",
                                            style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                    },
                                  );
                                }) ,
                          )
                        ],
                      ),
                    ),
                    //------------------------

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text("BioGraphy",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,color: Color(0xffF79A00)),),

                        SizedBox(width: 157,),
                        InkWell(
                          child: Text("View All >>",style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: Color(0xffF79A00)),),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Biography()));
                          },
                        ),

                      ],),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Row(
                        children: [
                          SizedBox( height:218,width:MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(width: 10,),

                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),
                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    //-------------------------

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text("Indian War",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,color: Color(0xffF79A00)),),

                        SizedBox(width: 157,),
                        InkWell(
                          child: Text("View All >>",style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 15,color: Color(0xffF79A00)),),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Indian()));
                          },
                        ),

                      ],),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top:10),
                      child: Row(
                        children: [
                          SizedBox( height:218,width:MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(width: 10,),

                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),
                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                                SizedBox(width: 20),
                                InkWell(
                                  child: Container( height: 340 ,width: 110,
                                    //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/im1.jpg",fit: BoxFit.contain,height: 160,),
                                        SizedBox(height: 5,),
                                        Text("Patiyala ke Raja \n \t\t Bhupendra",
                                          style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                                  },
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    //-------------------------

                    SizedBox(height: 20,)


                  ],
                ),
              ),

            ),
  //---------------------------------
            Expanded(
                child: Container(height: 10,width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xffF79A00),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32))
              ),
              child: SingleChildScrollView(scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    SizedBox(width: 15,),
                    InkWell(
                      child: Container( height: 50,width: 70,
                      //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                        child: Column(children: [
                          SizedBox(height: 3,),
                          Icon(Icons.add_to_photos_sharp,color: Colors.white,size: 28,),
                          Text("TOP 10",style: TextStyle(color: Colors.white,fontSize: 16,
                              fontWeight: FontWeight.bold),)
                        ],),
                      ),onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>choice()));
                       },//ontap
                    ),
                    SizedBox(width: 15,),
                    InkWell(
                      child: Container( height: 50,width: 70,
                        //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                        child: Column(children: [
                          SizedBox(height: 3,),
                          Icon(Icons.slow_motion_video_sharp,color: Colors.white,size: 28,),
                          Text("VIDEOS",style: TextStyle(color: Colors.white,fontSize: 16,
                              fontWeight: FontWeight.bold),)
                        ],),
                      ),onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>YTplay()));
                    },//ontap
                    ),

                    SizedBox(width: 15,),
                    InkWell(
                      child: Container( height: 50,width: 70,
                       // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                        child: Column(children: [
                          SizedBox(height: 3,),
                          Icon(Icons.photo_library_outlined,color: Colors.white,size: 28),
                          Text("IMAGES",style: TextStyle(color: Colors.white,fontSize: 16,
                              fontWeight: FontWeight.bold))
                        ],),
                      ),onTap: (){  Navigator.push(context,MaterialPageRoute(builder: (context)=>Img())); },
                    ),

                    SizedBox(width: 15,),
                  ],
                ),
              ),
            ))

          ],
        ),
  //-----------------
        drawer: Drawer(
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
                                      style: TextStyle(fontSize: 21, color: Color(0xff035891),
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
                        Image.asset("assets/images/drawer4.png",color: Colors.white,height: 40,),

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
                                      style: TextStyle(fontSize: 21, color: Color(0xff035891),
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
                        Image.asset("assets/images/drawer3.png",color: Colors.white,height: 40,),

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
                 padding: const EdgeInsets.only(top: 100,left: 90),
                 child: Row(
                   children: [
                     InkWell(child: Column(
                       children: [
                         Image.asset("assets/images/exit.png",height: 90,),
                         SizedBox(height: 5,),
                         Text("LOG-OUT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,
                             color: Color(0xff020288)),)
                       ],
                     ),
                     onTap: (){
                       logindata.setBool('login', true);
                       Navigator.pushReplacement(context,
                           new MaterialPageRoute(builder: (context) => FirstPage()));
                       signOut();
                     },
                     ),

                     SizedBox(width: 70),


                   ],
                 ),
               ),

                ],
              ),
            )),
  //---------------

      ),
    );
  }
}


