import 'package:flutter/material.dart';
import 'package:yathaarth_gyaanam/audioplay.dart';

class Poetry extends StatefulWidget {
  const Poetry({Key? key}) : super(key: key);

  @override
  State<Poetry> createState() => _PoetryState();
}

class _PoetryState extends State<Poetry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Poetry",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold),),backgroundColor: Color(0xffF79A00),centerTitle: true, ),

        body: SingleChildScrollView( scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: Column(children: [
              SizedBox(height: 40,),

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
        )


    );
  }
}
