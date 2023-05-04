import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:myflutterapp/Selectlocation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yathaarth_gyaanam/T1.dart';
import 'package:yathaarth_gyaanam/intro/login.dart';
import 'package:yathaarth_gyaanam/intro/sign.dart';


class onboardscreen extends StatefulWidget {
  const onboardscreen({Key? key}) : super(key: key);

  @override
  State<onboardscreen> createState() => _onboardscreenState();
}

class _onboardscreenState extends State<onboardscreen> {
  final controller =PageController();
  void dispose(){
    controller.dispose();
    super.dispose();
  }
//-------------------------------


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

  PageController pageController= PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  onBackPressed ,
      child: Scaffold(body:
      Container(
        decoration: BoxDecoration(gradient:LinearGradient(begin: Alignment.topRight,
          end:Alignment.bottomLeft,
          colors: [Color(0xffFAFAFC), Color(0XFFFAFAFC)] ),),
        child: Stack(children: [

//----------------------------------------------------------------------------------
          SingleChildScrollView( scrollDirection: Axis.vertical,
            child: Container(width: double.maxFinite,height:MediaQuery.of(context).size.height,
            child: PageView(controller:pageController,
              children: [
                Container( key: Key("1"),
                  child: SingleChildScrollView(scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(width: double.maxFinite,height: 100,),

                        Image(image: AssetImage("assets/images/dmgg.jpg"),height: 300,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 38,right: 30),
                          child: Text("Audio History Plateform",
                            style: TextStyle(fontSize: 25,color: Color(0xff347186),fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 12,right: 30),
                          child: Text("Get The Best Audios Facts Biographies Novels \n    And more About Indian History And Raja's",
                            style:TextStyle(fontSize: 14,color: Color(0xffF79A00),fontWeight: FontWeight.bold) ,),
                        ) ],
                    ),
                  ),
                ),

    //--------___22___--------------------------------------
                Container(key: Key("2"),
                  color: Color(0xffFFFFFF),
                  child: SingleChildScrollView( scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(width: double.maxFinite,height: 100,),
                        Image(image: AssetImage("assets/images/on3.jpg"),height: 300,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 38,right: 30),
                          child: Text("Facts About Indian Raja's",
                            style: TextStyle(fontSize: 25,color: Color(0xff347184),fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 15,right: 30),
                          child: Text("Here You Will Get The Best Amazing Facts Of\n         Indian Raja's And Unkown Stories",
                            style:TextStyle(fontSize: 14,color: Color(0xffF79A00),fontWeight: FontWeight.bold) ,),
                        )],
                    ),
                  ),
                ),
   //---------------------------------------------
                Container(
                  child: SingleChildScrollView(scrollDirection:Axis.vertical,
                    child: Column( key: Key("3"),
                      children: [
                        SizedBox(width: double.maxFinite,height: 102,),
                        Image(image: AssetImage("assets/images/dmg6.png"),height: 300,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 35,right: 30),
                          child: Text("Amazing Biographies",
                            style: TextStyle(fontSize: 25,color: Color(0xff347184),fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 10,right: 30),
                          child: Text("      Best Inspirational Biographies About \nInidan Real Hero's. Which Are Must To Be Know. ",
                            style:TextStyle(fontSize: 14,color: Color(0xffF79A00),fontWeight: FontWeight.bold) ,),
                        )
                      ],
                    ),
                  ),
                ),

                Container( color: Colors.white,key: Key("4"),
                  child: SingleChildScrollView(scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(width: double.maxFinite,height: 90,),
                        Image(image: AssetImage("assets/images/onbord1.jpg"),height: 300,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 40,right: 30),
                          child: Text("Get The Best Poetry",
                            style: TextStyle(fontSize: 25,color: Color(0xff347184),fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 15,right: 30),
                          child: Text("Motivational And Inspiring Poeties About \n   Religious And Facts. Which Motivate \n \t\t\t\t\t\t\t\t\t\t       About hinduism.",
                            style:TextStyle(fontSize: 14,color:Color(0xffF79A00),fontWeight: FontWeight.bold) ,),
                        )
                      ],
                    ),
                  ),
                )


              ],),
        ),
          ),

//---------------------------------------------------------------------------------------------
          Positioned(bottom: 140, left: 0, right: 0,
            child: Row(children: [
              Spacer(),
              SmoothPageIndicator(
                controller: pageController, count: 4,
                effect: WormEffect(dotHeight: 16, dotWidth: 16,dotColor: Color(0xffF0DC82),
                  activeDotColor:Color(0xffF79A00) ,
                  type: WormType.thin,
                  // strokeWidth: 5,
                ),
              ),
              Spacer()],
            ),
          ),

          Positioned(
            bottom: 6, left: 20, right: 20,
            child: InkWell(
              onTap: (){
                pageController.animateToPage(pageController.page!.toInt()+1, duration:Duration(milliseconds:400 )
                    ,curve: Curves.easeInOut);
              },
              child: Container(width: 250,height: 50,
                decoration: BoxDecoration(color: Color(0xffF79A00),borderRadius: BorderRadius.circular(20)),
                child: Center(child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 20,
                    fontWeight:FontWeight.bold ),)),
              ),
            ),
          ),



          Positioned(
            bottom: 70, left: 20, right: 20,
            child: InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
              },
              child: Container(width: 250,height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xffF79A00))),
                child: Center(child: Text("SKIP",style: TextStyle(color: Color(0xffF79A00),fontSize: 20,
                    fontWeight:FontWeight.bold ),)),
              ),
            ),
          ),

//---------------------------------------------------------------------------------------------
          ],
        ),
      ),
      ),
    );
  }
}
