import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yathaarth_gyaanam/T1.dart';
import 'package:yathaarth_gyaanam/audioplay.dart';
import 'package:yathaarth_gyaanam/drawer.dart';
import 'package:yathaarth_gyaanam/screen/img_play.dart';
import 'package:yathaarth_gyaanam/screen/videoplay.dart';
import 'package:yathaarth_gyaanam/screen/vidframe.dart';


class choice extends StatefulWidget {
  const choice({Key? key}) : super(key: key);

  @override
  State<choice> createState() => _choiceState();
}

class _choiceState extends State<choice> {



  @override
  Widget build(BuildContext context) {

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

    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Editor Choice",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            backgroundColor: Color(0xffF79A00), centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded( flex: 11,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    SizedBox(height: 40,),

                    Container( height: 30,width: 180,
                      alignment: Alignment.center  ,
                     // decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                      child: Text("TOP - 10 Audios",style: TextStyle(color: Color(0xff347189),
                          fontWeight: FontWeight.bold,fontSize: 24),)
                    ),

                    SizedBox(height: 30,),
                    Container( height: 120,width: 320,
                      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                      child:
                      Row(children: [
                        Container(height:120 ,width: 120  ,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                          child: Image.asset("assets/images/im2.jpg",fit: BoxFit.fitHeight,height: 40,width: 20,),),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Patiyala ke Raja \n \t\t Bhupendra",
                                style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold,fontSize: 18)),

                            Padding(
                              padding: const EdgeInsets.only(left: 60,top: 10),
                              child: TextButton.icon(onPressed:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                              }, icon:Icon(Icons.play_circle),
                                  label: Text("Play",style: TextStyle(fontSize: 20),) ),
                            )
                          ],
                        )


                      ],),

                    ),
                    SizedBox(height: 20,),

                    Container( height: 120,width: 320,
                      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                      child:
                      Row(children: [
                        Container(height:120 ,width: 120  ,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                          child: Image.asset("assets/images/im2.jpg",fit: BoxFit.fitHeight,height: 40,width: 20,),),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Patiyala ke Raja \n \t\t Bhupendra",
                                style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold,fontSize: 18)),

                            Padding(
                              padding: const EdgeInsets.only(left: 60,top: 10),
                              child: TextButton.icon(onPressed:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                              }, icon:Icon(Icons.play_circle),
                                  label: Text("Play",style: TextStyle(fontSize: 20),) ),
                            )
                          ],
                        )


                      ],),

                    ),
                    SizedBox(height: 20,),

                    Container( height: 120,width: 320,
                      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                      child:
                      Row(children: [
                        Container(height:120 ,width: 120  ,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                          child: Image.asset("assets/images/im2.jpg",fit: BoxFit.fitHeight,height: 40,width: 20,),),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Patiyala ke Raja \n \t\t Bhupendra",
                                style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold,fontSize: 18)),

                            Padding(
                              padding: const EdgeInsets.only(left: 60,top: 10),
                              child: TextButton.icon(onPressed:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                              }, icon:Icon(Icons.play_circle),
                                  label: Text("Play",style: TextStyle(fontSize: 20),) ),
                            )
                          ],
                        )


                      ],),

                    ),
                    SizedBox(height: 20,),

                    Container( height: 120,width: 320,
                      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                      child:
                      Row(children: [
                        Container(height:120 ,width: 120  ,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                          child: Image.asset("assets/images/im2.jpg",fit: BoxFit.fitHeight,height: 40,width: 20,),),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Patiyala ke Raja \n \t\t Bhupendra",
                                style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold,fontSize: 18)),

                            Padding(
                              padding: const EdgeInsets.only(left: 60,top: 10),
                              child: TextButton.icon(onPressed:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                              }, icon:Icon(Icons.play_circle),
                                  label: Text("Play",style: TextStyle(fontSize: 20),) ),
                            )
                          ],
                        )


                      ],),

                    ),
                    SizedBox(height: 20,),

                    Container( height: 120,width: 320,
                      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                      child:
                      Row(children: [
                        Container(height:120 ,width: 120  ,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                          child: Image.asset("assets/images/im2.jpg",fit: BoxFit.fitHeight,height: 40,width: 20,),),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Patiyala ke Raja \n \t\t Bhupendra",
                                style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold,fontSize: 18)),

                            Padding(
                              padding: const EdgeInsets.only(left: 60,top: 10),
                              child: TextButton.icon(onPressed:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                              }, icon:Icon(Icons.play_circle),
                                  label: Text("Play",style: TextStyle(fontSize: 20),) ),
                            )
                          ],
                        )


                      ],),

                    ),
                    SizedBox(height: 20,),

                    Container( height: 120,width: 320,
                      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                      child:
                      Row(children: [
                        Container(height:120 ,width: 120  ,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                          child: Image.asset("assets/images/im2.jpg",fit: BoxFit.fitHeight,height: 40,width: 20,),),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Patiyala ke Raja \n \t\t Bhupendra",
                                style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold,fontSize: 18)),

                            Padding(
                              padding: const EdgeInsets.only(left: 60,top: 10),
                              child: TextButton.icon(onPressed:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                              }, icon:Icon(Icons.play_circle),
                                  label: Text("Play",style: TextStyle(fontSize: 20),) ),
                            )
                          ],
                        )


                      ],),

                    ),
                    SizedBox(height: 20,),

                    Container( height: 120,width: 320,
                      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                      child:
                      Row(children: [
                        Container(height:120 ,width: 120  ,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                          child: Image.asset("assets/images/im2.jpg",fit: BoxFit.fitHeight,height: 40,width: 20,),),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Patiyala ke Raja \n \t\t Bhupendra",
                                style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold,fontSize: 18)),

                            Padding(
                              padding: const EdgeInsets.only(left: 60,top: 10),
                              child: TextButton.icon(onPressed:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                              }, icon:Icon(Icons.play_circle),
                                  label: Text("Play",style: TextStyle(fontSize: 20),) ),
                            )
                          ],
                        )


                      ],),

                    ),
                    SizedBox(height: 20,),

                    Container( height: 120,width: 320,
                      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                      child:
                      Row(children: [
                        Container(height:120 ,width: 120  ,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                          child: Image.asset("assets/images/im2.jpg",fit: BoxFit.fitHeight,height: 40,width: 20,),),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Patiyala ke Raja \n \t\t Bhupendra",
                                style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold,fontSize: 18)),

                            Padding(
                              padding: const EdgeInsets.only(left: 60,top: 10),
                              child: TextButton.icon(onPressed:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                              }, icon:Icon(Icons.play_circle),
                                  label: Text("Play",style: TextStyle(fontSize: 20),) ),
                            )
                          ],
                        )


                      ],),

                    ),
                    SizedBox(height: 20,),

                    Container( height: 120,width: 320,
                      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                      child:
                      Row(children: [
                        Container(height:120 ,width: 120  ,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                          child: Image.asset("assets/images/im2.jpg",fit: BoxFit.fitHeight,height: 40,width: 20,),),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Patiyala ke Raja \n \t\t Bhupendra",
                                style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold,fontSize: 18)),

                            Padding(
                              padding: const EdgeInsets.only(left: 60,top: 10),
                              child: TextButton.icon(onPressed:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                              }, icon:Icon(Icons.play_circle),
                                  label: Text("Play",style: TextStyle(fontSize: 20),) ),
                            )
                          ],
                        )


                      ],),

                    ),
                    SizedBox(height: 20,),

                    Container( height: 120,width: 320,
                      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                      child:
                      Row(children: [
                        Container(height:120 ,width: 120  ,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                          child: Image.asset("assets/images/im2.jpg",fit: BoxFit.fitHeight,height: 40,width: 20,),),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            SizedBox(height: 15,),
                            Text("Patiyala ke Raja \n \t\t Bhupendra",
                                style: TextStyle(color: Color(0xff347189),fontWeight: FontWeight.bold,fontSize: 18)),

                            Padding(
                              padding: const EdgeInsets.only(left: 60,top: 10),
                              child: TextButton.icon(onPressed:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MusicTime()));
                              }, icon:Icon(Icons.play_circle),
                                  label: Text("Play",style: TextStyle(fontSize: 20),) ),
                            )
                          ],
                        )


                      ],),

                    ),

                    SizedBox(height: 20,),

                  ],),
                ),
              ),

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
                                Icon(Icons.settings_backup_restore,color: Colors.white,size: 28,),
                                Text("HOME",style: TextStyle(color: Colors.white,fontSize: 16,
                                    fontWeight: FontWeight.bold),)
                              ],),
                            ),onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>T1()));
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
                          SizedBox(width: 20,),

                          InkWell(
                            child: Container( height: 50,width: 70,
                              // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                              child: Column(children: [
                                SizedBox(height: 3,),
                                Icon(Icons.photo_library_outlined,color: Colors.white,size: 28),
                                Text("IMAGES",style: TextStyle(color: Colors.white,fontSize: 16,
                                    fontWeight: FontWeight.bold),)
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
        drawer: Drawers()

      ),
    );
  }
}
