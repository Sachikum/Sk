/*

 _____________________NOT__IN__USED____________________________


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yathaarth_gyaanam/T1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  final _FormKey = GlobalKey<FormState>();
  bool emailValid=false;

  final username_controller = TextEditingController();
  final gmail_controller = TextEditingController();
  final password_controller = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
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

  Future<void> googleLogin()async{
    print("googleLogin Mathod Called");
    GoogleSignIn _googleSignIn= GoogleSignIn();
    try{
      var result = await _googleSignIn.signIn();
      if (result == null){
        return;
      }

      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken,
          idToken: userData.idToken
      );
      var finalResult = await FirebaseAuth.instance.signInWithCredential(credential);
      print('EMaiL ${finalResult.user!.email}');
      Navigator.push(context, MaterialPageRoute(builder: (CTX)=>T1()));

    }
    catch(error){
      print(error);
    }
  }

   isGmailOrYahoo(mailaddr) {
    return mailaddr.endsWith('@gmail.com') || mailaddr.endsWith('@yahoo.com');
  }

  @override
  Widget build(BuildContext context) {
    double h= MediaQuery.of(context).size.height;
    double l= MediaQuery.of(context).size.width;
    return Scaffold(

      body: SingleChildScrollView(
        child: Form(
          key: _FormKey,
          child: Container( color: Color(0xffffffff),
            child: Stack(
              children: [

                Container(child: Image(image: AssetImage("assets/images/P12.jpg",),
                  width: l,height: h,fit: BoxFit.fill,),),


                SizedBox(height: 10,),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 338, left: 30, right: 30),
                  child: TextFormField(
                    validator: (username){
                      if (username == null) {
                        return null;
                      }
                      if (username.isEmpty) {
                        return 'Name can\'t be empty';
                      }

                      return null;
                    },
                    controller: username_controller,
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle,color: Color(0xffF79A00),),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
                        contentPadding: EdgeInsets.only(left: 50),
                        labelText: "username",
                        hintText: " Enter Full Name"),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 420, left: 30, right: 30),
                  child: TextFormField(
                    validator: (gmail){
                      if (gmail!.isEmpty || gmail.length < 8 || gmail.length > 35 || gmail.endsWith("other")) {
                        return "* Required";
                      }else
                        return null;
                    },
                    controller: gmail_controller,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined,color: Color(0xffF79A00),),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
                        contentPadding: EdgeInsets.only(left: 70),
                        labelText: "Gmail",
                        hintText: " Enter The Gmail"),
                  ),
                ),

                Padding(
                  padding:
                  const EdgeInsets.only(top: 500, left: 30, right: 30),
                  child: TextFormField(
                    validator: (password){
                      if (password!.isEmpty) {
                        return "* Required";
                      } else if (password.length < 6) {
                        return "Password should be atleast 6 characters";
                      } else if (password.length > 15) {
                        return "Password should not be greater than 15 characters";
                      } else
                        return null;
                    },
                    controller: password_controller,
                    obscureText: true,
                    enableSuggestions: true,
                    maxLength: 10,
                    keyboardType:TextInputType.number ,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_outlined,color: Color(0xffF79A00),),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
                        contentPadding: EdgeInsets.only(left: 70),
                        labelText: "passowrd",
                        hintText: " Enter The Password"),
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.only(top: 650 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Container( height: 40,width: 200
                            , decoration: BoxDecoration(color: Color(0xffF79A00),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Text("Sign Up",style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),),
                            ),
                          ),
                          onTap: (){
                            String username = username_controller.text;
                            String Gmail = gmail_controller.text;
                          emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(Gmail);

                            String password = password_controller.text;
                            if (_FormKey.currentState!.validate() && username !='' && password !=''
                                && Gmail !='' &&  emailValid) {
                              print('Successfull');
                              logindata.setBool('login', false);
                              logindata.setString('username', username);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => T1()));
                            }

                          },
                        ),
                      ],
                    )
                ),

                Padding(
                    padding: const EdgeInsets.only(top: 600,left:80 ),
                    child: InkWell(
                      child: Container( height: 40,width: 200
                        , decoration: BoxDecoration(color: Color(0xffF79A00),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(
                          child: Text("Google ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                              fontSize: 22),),
                        ),
                      ),
                      onTap: (){
                         googleLogin();

                      },
                    )
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
