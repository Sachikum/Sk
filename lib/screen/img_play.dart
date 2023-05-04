import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yathaarth_gyaanam/T1.dart';
import 'package:yathaarth_gyaanam/drawer.dart';
import 'package:yathaarth_gyaanam/screen/Choice.dart';
import 'package:yathaarth_gyaanam/screen/vidframe.dart';


class Img extends StatefulWidget {
  const Img({Key? key}) : super(key: key);

  @override
  State<Img> createState() => _ImgState();
}

class _ImgState extends State<Img> {

  var cd = Colors.transparent ;

//-----------------------------------------------------------------------------------
  String imgurl = "https://www.fluttercampus.com/img/banner.png";
  String imgurls = "https://i.postimg.cc/JhB6VGmm/ttt4.jpg";
  String img3 = "https://i.postimg.cc/TwXnhcL7/imgs.jpg";
  String img4 = "https://i.postimg.cc/gJxz8CCN/IMG-20221005-104047.jpg";
         //______START__CHANGE__FROM__IMG-5__ROW-3____
  String img5 = "https://i.postimg.cc/gJxz8CCN/IMG-20221005-104047.jpg";
  String img6 = "https://i.postimg.cc/gJxz8CCN/IMG-20221005-104047.jpg";
  String img7 = "https://i.postimg.cc/gJxz8CCN/IMG-20221005-104047.jpg";
  String img8 = "https://i.postimg.cc/gJxz8CCN/IMG-20221005-104047.jpg";
  String img9 = "https://i.postimg.cc/gJxz8CCN/IMG-20221005-104047.jpg";
  String img10 = "https://i.postimg.cc/gJxz8CCN/IMG-20221005-104047.jpg";
  String img11 = "https://i.postimg.cc/gJxz8CCN/IMG-20221005-104047.jpg";
  String img12 = "https://i.postimg.cc/gJxz8CCN/IMG-20221005-104047.jpg";
//-----------------------------------------------------------------------------------

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
                  style: TextStyle(color: Color(0xff035891),fontSize: 23,
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
      onWillPop: onBackPressed ,
      child: Scaffold(
          appBar: AppBar( centerTitle: true, title: Text(" IMAGES ",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.orange,),

          body: Column(
            children: [
              Expanded(flex: 11,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [

                      SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(width: 14,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(imgurl, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=>  Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    imgurl ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "imgurl.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              imgurl,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.orange,
                                        ));
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                          SizedBox(width: 10,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(imgurls, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=> Dialog(
                                            backgroundColor: Colors.transparent,
                                          child: Container( height: 350,
                                            child: InteractiveViewer(
                                              panEnabled: false, // Set it to false
                                              boundaryMargin: EdgeInsets.all(100),
                                              minScale: 0.2,
                                              maxScale: 24,
                                              child: Image.network(
                                                imgurls        ,
                                                width: 300,
                                                height: 300,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "imgurls.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              imgurls,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(width: 14,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(img3, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=>  Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    img3 ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "img3.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              img3,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.orange,
                                        ));
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                          SizedBox(width: 10,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(img4, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=>  Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    img4  ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "img4.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              img4,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(width: 14,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(img5, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=>  Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    img5 ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "imgurl.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              imgurl,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.orange,
                                        ));
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                          SizedBox(width: 10,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(img6, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=> Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    img6        ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "imgurls.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              imgurls,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(width: 14,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(img7, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=>  Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    img7 ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "img3.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              img3,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.orange,
                                        ));
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                          SizedBox(width: 10,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(img8, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=>  Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    img8  ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "img4.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              img4,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(width: 14,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(img9, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=>  Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    img9 ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "imgurl.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              imgurl,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.orange,
                                        ));
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                          SizedBox(width: 10,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(img10, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=> Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    img10 ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "imgurls.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              imgurls,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(width: 14,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(img3, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=>  Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    img3 ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "img3.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              img3,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.orange,
                                        ));
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                          SizedBox(width: 10,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(img4, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=>  Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    img4  ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "img4.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              img4,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(width: 14,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(imgurl, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=>  Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    imgurl ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "imgurl.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              imgurl,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.orange,
                                        ));
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                          SizedBox(width: 10,),
                          Container( height: 210  , width: 160,
                            decoration: BoxDecoration(border: Border.all(color: cd)),
                            child: Column(
                              children: [
                                InkWell(child: Image.network(imgurls, height: 150,)
                                    ,onTap: (){
                                      showDialog(context: context,
                                          builder:(BuildContext context)=> Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container( height: 350,
                                                child: InteractiveViewer(
                                                  panEnabled: false, // Set it to false
                                                  boundaryMargin: EdgeInsets.all(100),
                                                  minScale: 0.2,
                                                  maxScale: 24,
                                                  child: Image.network(
                                                    imgurls        ,
                                                    width: 300,
                                                    height: 300,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }),
                                Divider(),

                                InkWell(
                                  child: Container( height: 30,width: 70 ,
                                    decoration: BoxDecoration(color: Colors.orange,
                                        borderRadius: BorderRadius.all(Radius.circular(12))),

                                    child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.white),)),
                                  ),
                                  onTap: () async {
                                    Map<Permission, PermissionStatus> statuses = await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();

                                    if(statuses[Permission.storage]!.isGranted){
                                      var dir = await DownloadsPathProvider.downloadsDirectory;
                                      if(dir != null){
                                        String savename = "imgurls.png";
                                        String savePath = dir.path + "/$savename";
                                        print(savePath);
                                        //output:  /storage/emulated/0/Download/banner.png

                                        try {
                                          await Dio().download(
                                              imgurls,
                                              savePath,
                                              onReceiveProgress: (received, total) {
                                                if (total != -1) {
                                                  print((received / total * 100).toStringAsFixed(0) + "%");
                                                  //you can build progressbar feature too
                                                }
                                              });
                                          print("Image is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      }
                                    }else{
                                      print("No permission to read and write.");
                                    }
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor:  Colors.orange,
                                          actions: [

                                            Container( height: 50, width: 300 ,
                                              decoration: BoxDecoration( color: Colors.white
                                                  ,borderRadius: BorderRadius.circular(22)),
                                              child: Center(
                                                child: Text("Your Image Is Saved",
                                                  style: TextStyle(color: Color(0xff035891),fontSize: 20,
                                                      fontWeight: FontWeight.bold),),
                                              ),
                                            )

                                          ],
                                        ));

                                  },
                                )

                              ],
                            ),
                          ),

                        ],
                      ),


                    ],
                  ),
                ),
              ),

              Expanded(
                child: Container(height: 10,width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomCenter,
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
                              Icon(Icons.slow_motion_video_sharp,color: Colors.white,size: 28,),
                              Text("VIDEO",style: TextStyle(color: Colors.white,fontSize: 16,
                                  fontWeight: FontWeight.bold),)
                            ],),
                          ),onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>YTplay()));
                        },//ontap
                        ),

                        SizedBox(width: 15,),
                        InkWell(
                          child: Container( height: 50,width: 70,
                            //  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                            child: Column(children: [
                              Icon(Icons.add_to_photos_sharp,color: Colors.white,size: 28,),
                              Text("TOP 10",style: TextStyle(color: Colors.white,fontSize: 16,
                              fontWeight: FontWeight.bold),)
                            ],),
                          ),onTap: (){
                           Navigator.push(context,MaterialPageRoute(builder: (context)=>choice()));
                        },//ontap
                        ),

                        SizedBox(width: 15,),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          drawer: Drawers()
      ),
    );
  }
}