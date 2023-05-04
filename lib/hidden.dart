import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yathaarth_gyaanam/audioplay.dart';
import 'hidden2.dart';

class Hidden extends StatefulWidget {
  const Hidden({Key? key}) : super(key: key);

  @override
  State<Hidden> createState() => _HiddenState();
}

class _HiddenState extends State<Hidden> {

  final FormKey = GlobalKey<FormState>();

 String name = "sachin";
 String showpassword = "sachin8080";

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  String Text1 = "" ;
  String Text2 = "" ;

  @override
  Widget build(BuildContext context) {
    double h= MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Yathaarth Gyaanam",style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),backgroundColor: Color(0xff035891),centerTitle: true, ),

      body: Form( key: FormKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [

              Image.asset("assets/images/backgg.png",height:h)

             , Padding(
                padding: const EdgeInsets.only(top: 190,left: 30),
                child: Text("WellCome To Hidden space",style: TextStyle(fontSize: 24,
                    color:Color(0xff035891),
                    fontWeight: FontWeight.bold ),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 260,left: 50,right: 50),
                child: TextFormField(
                  onChanged: (value){
                    Text1 = username_controller.text;
                  },
                  controller: username_controller,
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle,color: Color(0xff035891)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
                      contentPadding: EdgeInsets.only(left: 50),
                      labelText: "username",
                      hintText: " Enter Full Name"),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 350,left: 50,right: 50),
                child: TextFormField(
                  onChanged: (value){
                    Text2 = password_controller.text;
                  },
                  controller: password_controller,
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle,color:Color(0xff035891)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
                      contentPadding: EdgeInsets.only(left: 50),
                      labelText: "Password",
                      hintText: " Enter Password"),
                ),
              ),


              Padding(
                  padding: const EdgeInsets.only(top: 450,left:80,right: 30 ),
                  child: InkWell(
                    child: Container( height: 40,width: 200
                      , decoration: BoxDecoration(color: Color(0xff035891),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text("LOGIN",style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),),
                      ),
                    ),
                    onTap: (){

                        if (Text1 == "sachin" && Text2 == "sachin8080")
                        {  Navigator.push(context, MaterialPageRoute(builder: (context) => Hidden2())); }
                        return
                          ( print('error please input a valid' ));


                    },
                  )
              ),


            ],
          ),
        ),
      )

    );
  }
}
