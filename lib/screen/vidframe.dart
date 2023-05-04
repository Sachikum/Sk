
import 'package:flutter/material.dart';
import 'package:yathaarth_gyaanam/T1.dart';
import 'package:yathaarth_gyaanam/drawer.dart';
import 'package:yathaarth_gyaanam/screen/Choice.dart';
import 'package:yathaarth_gyaanam/screen/img_play.dart';
import 'package:yathaarth_gyaanam/screen/videoplay.dart';


class YTplay extends StatefulWidget {
  const YTplay({Key? key}) : super(key: key);

  @override
  State<YTplay> createState() => _YTplayState();
}

class _YTplayState extends State<YTplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:true,backgroundColor: Colors.orange ,
          title: const Text("Watch The Video 's",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          )),
      body: Column(
        children: [

          Expanded( flex: 11,
              child: SingleChildScrollView(scrollDirection: Axis.vertical,
                child: Column(children: [
                Column(
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Container( height: 300,width: 170,
                          child:  Image.asset("assets/images/vimg.jpg",fit: BoxFit.fill,),
                        ),
                      ),
                    ),onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>YTVideo()));
                  },
                  ),
                  Text("watch this video")

                ],
            ),
                SizedBox(height: 20,),
                Column(
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Container( height: 300,width: 170,
                          child:  Image.asset("assets/images/vimg.jpg",fit: BoxFit.fill,),
                        ),
                      ),
                    ),onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>YTVideo()));
                  },
                  ),
                  Text("watch this video")

                ],
            ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Container( height: 300,width: 170,
                              child:  Image.asset("assets/images/vimg.jpg",fit: BoxFit.fill,),
                            ),
                          ),
                        ),onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>YTVideo()));
                      },
                      ),
                      Text("watch this video")

                    ],
                  ),

                    ],),
              )),

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
                            Icon(Icons.add_to_photos_sharp,color: Colors.white,size: 28,),
                            Text("TOP 10",style: TextStyle(color: Colors.white,fontSize: 16,
                                fontWeight: FontWeight.bold),)
                          ],),
                        ),onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>choice()));
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

        ],),
       drawer: Drawers(),
    );
  }
}
