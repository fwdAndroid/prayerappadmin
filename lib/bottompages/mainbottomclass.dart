import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayerappadmin/bottompages/mainbottoms.dart';
import 'package:prayerappadmin/utils/authutils.dart';
import 'package:prayerappadmin/widgets/customdialog.dart';

import '../utils/constant.dart';

class MainBottomClass extends StatefulWidget {
  const MainBottomClass({Key? key}) : super(key: key);

  @override
  _MainBottomClassState createState() => _MainBottomClassState();
}

class _MainBottomClassState extends State<MainBottomClass> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    // firebaseAuth.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     print('User is currently signed out!');
    //   } else {
    //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>MainBottom()), (route) => false) ;
    //     }});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Image.asset(
              'assets/greenimage.png',
              height: 300,
              width: 200,
            )),
            Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 30),

                //  padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                    bottomLeft: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0),
                  ),
                  // border: Border.all(color: Colors.grey,width: 0.5)
                ),
                child: TextFormField(
                  controller: emailController,
                  //  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: ' Enter Email address',
                    contentPadding: new EdgeInsets.fromLTRB(15, 15, 15, 15),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(),
                    ),
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      color: Color(0xff8D8989), // <-- Change this
                      fontSize: null,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    // focusedBorder:OutlineInputBorder(
                    //   // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    //   borderRadius: BorderRadius.circular(25.0),
                    // hintTextDirection: HitTestDispatcher.,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 30),

                //  padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                    bottomLeft: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0),
                  ),
                  // border: Border.all(color: Colors.grey,width: 0.5)
                ),
                child: TextFormField(
                  controller: passwordController,
                  //  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: ' Password',
                    contentPadding: new EdgeInsets.fromLTRB(15, 15, 15, 15),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(),
                    ),
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                      color: Color(0xff8D8989), // <-- Change this
                      fontSize: null,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
                    // focusedBorder:OutlineInputBorder(
                    //   // borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    //   borderRadius: BorderRadius.circular(25.0),
                    // hintTextDirection: HitTestDispatcher.,
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff00722d),
                minimumSize: Size(240, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
              ),
              onPressed: () {
                if (emailController.text.isEmpty &&
                    passwordController.text.isEmpty) {
                  Customdialog()
                      .showInSnackBar("Please enter All Fields", context);
                } else if (emailController.text.isEmpty) {
                  Customdialog().showInSnackBar("Please enter email", context);
                } else if (passwordController.text.isEmpty) {
                  Customdialog().showInSnackBar("Please enter password", context);
                } else if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  Customdialog.showDialogBox(context);
                  AuthUtils().loginUser(emailController.text.trim(),
                      passwordController.text.trim(), context);
                }
              },
              child: Text(
                'Sign In',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      
    );
  }
}
