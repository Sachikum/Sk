import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MusicTime extends StatefulWidget {
  const MusicTime({Key? key}) : super(key: key);

  @override
  State<MusicTime> createState() => _MusicTimeState();
}

class _MusicTimeState extends State<MusicTime> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";

  String audioasset = "assets/audios/Titanic.mp3";

  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {

      ByteData bytes = await rootBundle.load(audioasset); //load audios from assets
      audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      //convert ByteData to Uint8List

      player.onDurationChanged.listen((Duration d) { //get the duration of audios
        maxduration = d.inMilliseconds;
        setState(() {

        });
      });

      player.onAudioPositionChanged.listen((Duration  p){
        currentpos = p.inMilliseconds; //get the current position of playing audios

        //generating the duration label
        int shours = Duration(milliseconds:currentpos).inHours;
        int sminutes = Duration(milliseconds:currentpos).inMinutes;
        int sseconds = Duration(milliseconds:currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rhours:$rminutes:$rseconds";

        setState(() {
          //refresh the UI
        });
      });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Yathaarth Gyaanam",style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold),),backgroundColor: Color(0xffF79A00),centerTitle: true, ),

        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image(image: AssetImage("assets/images/dmg2.png"),height: 300,),
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Container(  height: 170,
                   // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    margin: EdgeInsets.only(top:50),
                    child: Column(
                      children: [

                        Container(
                         // decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
                          child: Text(currentpostlabel, style: TextStyle(fontSize: 25),),
                        ),

                        Container(
                           // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                            child: Slider(
                              value: double.parse(currentpos.toString()),
                              min: 0,
                              max: double.parse(maxduration.toString()),
                              divisions: maxduration,
                              label: currentpostlabel,
                              onChanged: (double value) async {
                                int seekval = value.round();
                                int result = await player.seek(Duration(milliseconds: seekval));
                                if(result == 1){ //seek successful
                                  currentpos = seekval;
                                }else{
                                  print("Seek unsuccessful.");
                                }
                              },
                            )
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            //decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                            child: Wrap(
                              spacing: 50,
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () async {
                                      if(!isplaying && !audioplayed){
                                        int result = await player.playBytes(audiobytes);
                                        if(result == 1){ //play success
                                          setState(() {
                                            isplaying = true;
                                            audioplayed = true;
                                          });
                                        }else{
                                          print("Error while playing audios.");
                                        }
                                      }else if(audioplayed && !isplaying){
                                        int result = await player.resume();
                                        if(result == 1){ //resume success
                                          setState(() {
                                            isplaying = true;
                                            audioplayed = true;
                                          });
                                        }else{
                                          print("Error on resume audios.");
                                        }
                                      }else{
                                        int result = await player.pause();
                                        if(result == 1){ //pause success
                                          setState(() {
                                            isplaying = false;
                                          });
                                        }else{
                                          print("Error on pause audios.");
                                        }
                                      }
                                    },
                                    icon: Icon(isplaying?Icons.pause:Icons.play_arrow),
                                    label:Text(isplaying?"Pause":"Play")
                                ),

                                ElevatedButton.icon(
                                    onPressed: () async {
                                      int result = await player.stop();
                                      if(result == 1){ //stop success
                                        setState(() {
                                          isplaying = false;
                                          audioplayed = false;
                                          currentpos = 0;
                                        });
                                      }else{
                                        print("Error on stop audios.");
                                      }
                                    },
                                    icon: Icon(Icons.stop),
                                    label:Text("Reset")
                                ),
                              ],
                            ),
                          ),
                        )

                      ],
                    )

                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InkWell(
                  child: Container(width: 150,
                   // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    child: Row(
                      children: [
                        Text("Disclaimer",style: TextStyle(color: Color(0xff035891),fontSize: 22,
                        fontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),
                        Icon(Icons.screen_rotation_alt,size: 30,color: Color(0xff035891),)
                      ],
                    ),
                  ),onTap: (){
                  showModalBottomSheet<void>(
                    context: context,builder: (BuildContext context) {
                    return Container(
                      color: Color(0xffF79A00),height: 300,
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Text("Disclaimer",style: TextStyle(color: Colors.white,
                              fontWeight:FontWeight.bold, fontSize: 22),)
                        ],
                      ),
                    );
                    },
                  );
                },
                ),
              )

            ],
          ),
        )
    );
  }
}
