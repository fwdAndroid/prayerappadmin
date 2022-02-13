import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prayerappadmin/providers/idprovider.dart';
import 'package:prayerappadmin/questionsection/add_solutions.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:prayerappadmin/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
class ViewSolutionwithAudio extends StatefulWidget {
   ViewSolutionwithAudio({ Key? key }) : super(key: key);

  @override
  _ViewSolutionwithAudioState createState() => _ViewSolutionwithAudioState();
}

class _ViewSolutionwithAudioState extends State<ViewSolutionwithAudio> {
  File? audioUrl;
  String audioLink="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('View Solution'),
       

        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder) => AddSolutions()));
          }, child: Text('Add Solutions',style: TextStyle(color: Colors.white,fontSize: 15),))
        ],
      ),
      body:   StreamBuilder(
        stream: firebaseFirestore.collection("topics").
      doc(Provider.of<IdProvider>(context,listen: false).id).collection("questions").snapshots()
        ,builder: (context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context,int index){
            DocumentSnapshot ds=snapshot.data!.docs[index];
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Card(
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        //When we Clicked I opened same page but here he can only view it or edit
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => AddSolutions(
                            question: ds['Question'],
                            sol1: ds['Answer1'],
                            sol2: ds['Answer2'],
                            sol3: ds['Answer3'],
                            id: ds.id,
                          )));
                        },
                        title: Text('Q#${index.toString() +"  "+ds['Question']}'),
                        trailing: Icon(Icons.edit,color: Colors.black,),

                      ),

                    ],
                  ),
                ),
              );
              });
        }
        else if(snapshot.hasError){
          return Center(child: Text("Error Accured"));
        }

        else {
          return Center(child: CircularProgressIndicator());
        }
        // return Center(child: CircularProgressIndicator());
      },),
      
      
    );
  }
  Future uploadAudioToFirebase() async {
    File? fileName =audioUrl;
    var uuid = Uuid();
    firebase_storage.Reference firebaseStorageRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('topic/audios+${uuid.v4()}');
    firebase_storage.UploadTask uploadTask =
    firebaseStorageRef.putFile(fileName!);
    firebase_storage.TaskSnapshot taskSnapshot =
    await uploadTask.whenComplete(() async {
      print(fileName);
      String audio = await uploadTask.snapshot.ref.getDownloadURL();
      setState(() {
        audioLink = audio;
      });
    });
  }
}