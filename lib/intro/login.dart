import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:yathaarth_gyaanam/Modal/signUp_modal.dart';
import 'package:yathaarth_gyaanam/T1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
//------------------------------------------

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
    name_controller.dispose();
    mobile_controller.dispose();
    gmail_controller.dispose();
    super.dispose();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signInWithGoogle() async
  {
    try{

      //SIGNING IN WITH GOOGLE
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      //CREATING CREDENTIAL FOR FIREBASE
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken
      );

      //SIGNING IN WITH CREDENTIAL & MAKING A USER IN FIREBASE  AND GETTING USER CLASS
      final userCredential  = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      //CHECKING IS ON
      assert(!user!.isAnonymous);
      assert(await user!.getIdToken() != null);

      final User? currentUser = await _auth.currentUser;
      assert(currentUser!.uid == user!.uid);
      print(user);
      Navigator.push(context, new MaterialPageRoute(builder: (context) => T1()));
      return user;
    }catch(e){
      print(e);
    }

  }

//-------------------------------------------
  final _FormKey = GlobalKey<FormState>();
  bool emailValid = false;

  final name_controller = TextEditingController();
  final gmail_controller = TextEditingController();
  final mobile_controller = TextEditingController();
  bool isSummited = false;

  SignUp(mobile, name, gmail) async {
    setState(() {
      isSummited = true;
    });

    final response = await http.post(Uri.parse(
        "https://maestrosinfotech.org/vidhya/Api/process.php?action=signup"),body: {
      'name':name,
      'email':gmail,
      'mobile':mobile,
      'gender':'male'

    });

    if (response.statusCode == 200) {
      print("object success");
      setState(() {
        isSummited = false;
      });

      SignUpModal login = SignUpModal.fromJson(jsonDecode(response.body));


      if (login.message == "Registration Successfully") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => T1()));
      } else {
        print("error");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffFAEAD3),
      body: SingleChildScrollView(
        child: Form(
          key: _FormKey,
          child: Container(color:Color(0xffFAEAD3),
            child: Stack(
              children: [


                Padding(
                  padding: const EdgeInsets.only(top: 37.9),
                  child: Container(
                   // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    child: Image(image: AssetImage("assets/images/ttt4.jpg",),fit: BoxFit.fill,
                      width: l, height: 300, ),),
                ),


                SizedBox(height: 10,),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 338, left: 30, right: 30),
                  child: TextFormField(
                    validator: (name) {
                      if (name == null) {
                        return null;
                      }
                      if (name.isEmpty) {
                        return 'Name can\'t be empty';
                      }

                      return null;
                    },
                    controller: name_controller,
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle, color: Color(0xffF79A00),),
                        border: OutlineInputBorder( borderSide: BorderSide(color: Color(0xff39383B),
                        width: 14),
                            borderRadius: BorderRadius.circular(22)),
                        contentPadding: EdgeInsets.only(left: 50),
                        labelText: "name",
                        hintText: " Enter Full Name"),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 420, left: 30, right: 30),
                  child: TextFormField(
                    validator: (gmail) {
                      if (gmail!.isEmpty || gmail.length < 8 ||
                          gmail.length > 45 || gmail.endsWith("other")) {
                        return "* Required";
                      } else
                        return null;
                    },
                    controller: gmail_controller,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined, color: Color(0xffF79A00),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22)),
                        contentPadding: EdgeInsets.only(left: 70),
                        labelText: "Gmail",
                        hintText: " Enter The Gmail"),
                  ),
                ),

                Padding(
                  padding:
                  const EdgeInsets.only(top: 500, left: 30, right: 30),
                  child: TextFormField(
                    validator: (mobile) {
                      if (mobile!.isEmpty) {
                        return "* Required";
                      } else if (mobile.length != 10) {
                        return "error";
                      }
                      return null;
                    },
                    controller: mobile_controller,
                    obscureText: true,
                    enableSuggestions: true,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_outlined,
                          color: Color(0xffF79A00),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22)),
                        contentPadding: EdgeInsets.only(left: 70),
                        labelText: "mobile",
                        hintText: " Enter The Mobile Number"),
                  ),
                ),

                isSummited?Padding(
                  padding: const EdgeInsets.only(top: 290),
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.orange,
                  )),
                ): Padding(
                    padding: const EdgeInsets.only(top: 650),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Container(height: 40, width: 200
                            , decoration: BoxDecoration(color: Color(
                                0xffF79A00),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up", style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),),
                            ),
                          ),
                          onTap: () {

                            String username = name_controller.text;
                            String Gmail = gmail_controller.text;
                            emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(Gmail);

                            String password = mobile_controller.text;
                            if (_FormKey.currentState!.validate() && username !='' && password !=''
                                && Gmail !='' &&  emailValid) {
                              print('Successfull');
                              logindata.setBool('login', false);
                              logindata.setString('username', username);
                            }
                            //---------------------------------------------------
                            SignUp(name_controller.text, gmail_controller.text,
                                mobile_controller.text);
                            if (_FormKey.currentState!.validate()) {
                              print('Successfull validtion');
                            }
                          },
                        ),
                      ],
                    )
                ),

               /* Padding(
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
                        signInWithGoogle();

                      },
                    )
                ),*/


              ],
            ),
          ),
        ),
      ),
    );
  }
}

