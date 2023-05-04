import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/services.dart';
import 'intro/firstpage.dart';

class Hidden2 extends StatefulWidget {
  const Hidden2({Key? key}) : super(key: key);

  @override
  State<Hidden2> createState() => _Hidden2State();
}

class _Hidden2State extends State<Hidden2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Yathaarth Gyaanam",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff035891),
          centerTitle: true,
        ),
        backgroundColor: Color(0xffADC7D9),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 190, left: 30),
              child: Text(
                "WellCome To Hidden space",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff035891),
                    fontWeight: FontWeight.bold),
              ),
            ),
            DoubleBackToCloseApp(
              snackBar: const SnackBar(
                content: Text('Tap back again to leave'),
              ),
              child: Center(
                child: TextButton(
                  child: const Text('Tap to simulate back'),
                  // ignore: invalid_use_of_protected_member
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.blueGrey,
                              actions: [
                                Column(
                                  children: [
                                    Text("Are You Want To Exit",
                                      style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold),),
                                    TextButton(
                                        onPressed: () {
                                          SystemNavigator.pop();},
                                        child: Text("Exit",
                                          style: TextStyle(color: Colors.red),
                                        ))
                                  ],
                                )
                              ],
                            ));

                    //WidgetsBinding.instance!.handlePopRoute,
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                  },
                ),
              ),
            ),
          ],

        )
    );
  }
}
