import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayerappadmin/bottompages/mainbottomclass.dart';


import '../bottompages/mainbottoms.dart';
import '../widgets/customdialog.dart';
import 'constant.dart';

class AuthUtils {
  registerUser(

      String email,
      String password,  BuildContext context) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        firebaseFirestore
            .collection('admin')
            .doc(firebaseAuth.currentUser!.uid)
            .set({
          // 'UserName': name,
          'Email': email,
          // 'Phone Number':phoneNumber,
          // 'Address': address,
          // 'Gender': gender,
          // 'imageLink': imageLink,
          'Type': "admin",
          'Password':password
        }).then((value) {
          Customdialog().showInSnackBar("your are registered", context);
          // Provider.of<CircularProgressProvider>(context,listen: false).setValue(false);
          Customdialog.closeDialog(context);
        // type=="Client"?  Navigator.pushAndRemoveUntil(
        //       context,
        //       MaterialPageRoute(builder: (_) => LoginScreen(
        //         title:type,
        //       )),
        //       (route) => false):type=="Repair Man"?Navigator.pop(context):null;
        });
      }).catchError((onError) {
        throw onError;
        Navigator.pop(context);
        Customdialog.showBox(context, onError);
      });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      Customdialog.showBox(context, e.toString());
    }
  }

  loginUser(
      String email, String password, BuildContext context) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((v) {
        firebaseFirestore
            .collection('admin')
            .doc(v.user!.uid)
            .get()
            .then((doc) {
          print(doc['Email']);
          if (doc['Email'] == email && doc['Type'] == 'admin') {
            Customdialog().showInSnackBar("Admin Logged in", context);
            Customdialog.closeDialog(context);
           Navigator.pushAndRemoveUntil(
               context,
               MaterialPageRoute(builder: (_) => MainBottom()),
                   (route) => false);}
          else {
            Customdialog.closeDialog(context);
            // Customdialog.closeDialog(context);
            Customdialog().showInSnackBar("wrong Email Password", context);
            Customdialog.closeDialog(context);
          }
        });
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      Navigator.pop(context);
      Customdialog.showBox(context, e.toString());
    }
  }

  resetPassword(String email, BuildContext context) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
        Customdialog.closeDialog(context);
        Customdialog.closeDialog(context);
        Customdialog().showInSnackBar("Please Check your email", context);
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      Navigator.pop(context);
      Customdialog.showBox(context, e.toString());
    }
  }

  loginManagerUser(
      String email, String password, BuildContext context) async {
    try {
      await
        firebaseFirestore
            .collection('manager')
            .doc("lynmcefC3gfjbV9f1KmY")
            .get()
            .then((doc) {
          print(doc['email']);
          if (doc['email'].isNotEqual(email) && doc['password'] .isNotEqual(password)) {
            Customdialog.closeDialog(context);
            // Customdialog.closeDialog(context);
            Customdialog().showInSnackBar("wrong", context);
            Customdialog.closeDialog(context);

          } else {

            Customdialog().showInSnackBar("manager Logged in", context);
            Customdialog.closeDialog(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => MainBottom()),
                    (route) => false);

          }
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      Navigator.pop(context);
      Customdialog.showBox(context, e.toString());
    }
  }
}
